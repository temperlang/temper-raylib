#!/usr/bin/env python3

from sys import argv, stdout
import logging

logging.basicConfig(stream=stdout, level=logging.INFO, format='%(message)s')

import raypyc

import importlib

import glob

import typing
import types
import re
import abc

from functools import lru_cache

from types import SimpleNamespace

from sys import path

import ctypes

old = False

if argv[1] == '--mypyc':
    argv = argv[1:]
    for i in glob.glob('temper.out/mypyc/*'):
        path.append(i)
else:
    for i in glob.glob('temper.out/py/*'):
        path.append(i)

if argv[1] == '--old':
    argv = argv[1:]
    old = True

import temper_raylib.rl.raylib as temper_raylib

import random

name_map = {
    'rl_color3f': 'rl_color3_f',
    'rl_color4f': 'rl_color4_f',
    'rl_normal3f': 'rl_normal3_f',
    'rl_tex_coord2f': 'rl_tex_coord2_f',
    'rl_vertex2f': 'rl_vertex2_f',
    'rl_vertex2i': 'rl_vertex2_i',
    'rl_vertex3f': 'rl_vertex3_f',
    'rl_color4ub': 'rl_color4_ub',
    'end_mode2d': 'end_mode2_d',
    'end_mode3d': 'end_mode3_d',
}

def mangle(name):
    if name in name_map:
        return name_map[name]
    name = raypyc.underscore(name)
    name = name.replace('_3d', '3_d').replace('_2d', '2_d')
    return name

def type_to_property_names(type_obj):
    ret = {}
    for field_name in vars(type_obj):
        field = getattr(type_obj, field_name)
        if isinstance(field, property):
            ret[field_name] = getattr(type_obj, field_name).fget.__annotations__['return']
    return ret

def ctype_to_property_names(ctype_obj):
    return tuple(ctype_obj._fields_)

class ConvertException(Exception):
    pass

def get_ctype_converter(ctype, pytype_name):
    if re.match('(str)\\d+', pytype_name):
        def convert(obj):
            return ctype(obj.encode('utf-8'))
        return convert
    if re.match('(int|float|bool|Any)\\d+', pytype_name):
        return ctype
    if re.match('Sequence[(int|float|bool)\\d+]', pytype_name):
        ptr_type = ctype._type_
        def convert(obj):
            return ctype(map(ptr_type, obj))
        return convert
    if hasattr(temper_raylib, pytype_name):
        pytype = getattr(temper_raylib, pytype_name)
        ctype_map = ctype_to_property_names(ctype)
        pytype_map = type_to_property_names(pytype)
        eval_env = {'ctype': ctype}
        convert_calls = []
        for nth_key, (ctype_arg_name, sub_ctype) in enumerate(ctype_map):
            pytype_arg_name = raypyc.underscore(ctype_arg_name)
            eval_env[f'arg{nth_key}_convert'] = get_ctype_converter(sub_ctype, pytype_map[pytype_arg_name])
            convert_calls.append(f'arg{nth_key}_convert(obj.{pytype_arg_name})')
        converts = ', '.join(convert_calls)
        eval_text = f'lambda obj: ctype({converts})'
        return eval(eval_text, eval_env)
    raise ConvertException(f"cannot convert ctype {pytype_name} to type {ctype}")

def wrap_slow(func, proto):
    if not callable(func):
        return func
    if not hasattr(func, 'argtypes'):
        return func
    # types of all locals
    # return -> return type
    py_type_map = proto.__annotations__
    # names of all locals, which start with positional args
    # start at 1 to skip the self arg
    arg_names = proto.__code__.co_varnames[1:proto.__code__.co_argcount]
    arc_ctypes = func.argtypes
    eval_env = {'func': func}
    args_converted = []
    for index, arg_ctype in enumerate(arc_ctypes):
        argtype_str = py_type_map[arg_names[index]]
        try:
            convert = get_ctype_converter(
                arg_ctype,
                argtype_str
            )
        except ConvertException as e:
            print(f'fail {proto.__name__}: {str(e)}')
            return None
        eval_env[f'arg{index}_convert'] = convert
        args_converted.append(f'arg{index}_convert({arg_names[index]})')
    args = ', '.join(arg_names)
    args_converted_joined = ', '.join(args_converted)
    eval_text = f'lambda {args}: func({args_converted_joined})'
    return eval(eval_text, eval_env)

def wrap_fast(func, proto):
    if not callable(func):
        return func
    if not hasattr(func, 'argtypes'):
        return func
    py_type_map = proto.__annotations__
    arg_names = proto.__code__.co_varnames[0:proto.__code__.co_argcount]
    should_wrap = False
    new_args = []
    for arg_name in arg_names:
        if re.match('(str)\\d+', py_type_map[arg_name]):
            new_args.append(f'{arg_name}.encode("utf-8")')
            should_wrap = True
        else:
            new_args.append(arg_name)
    if should_wrap:
        params = ', '.join(arg_names)
        args = ', '.join(new_args)
        eval_text = f'lambda {params}: func({args})'
        return eval(eval_text, {'func':func})
    return func

def main():
    if old:
        wrapped_raylib = SimpleNamespace()

        for name in vars(raypyc):
            if name.startswith('_'):
                continue
            mangled = mangle(name)
            if hasattr(raypyc, name) and hasattr(temper_raylib.Raylib, mangled):
                setattr(wrapped_raylib, mangled, wrap_slow(getattr(raypyc, name), getattr(temper_raylib.Raylib, mangled)))

        temper_raylib.use(wrapped_raylib)
    else:
        temper_raylib_color = temper_raylib.Color
        temper_raylib_raylib = temper_raylib.Raylib
        demangle = {}
        for name in dir(raypyc):
            demangle[mangle(name)] = name
        for name in dir(temper_raylib):
            if name.startswith('_'):
                continue
            if name in ['use']:
                continue
            temper_obj = getattr(temper_raylib, name)
            if isinstance(temper_obj, (type(NotImplemented), str, int, float, bool)):
                continue
            elif isinstance(temper_obj, temper_raylib_color):
                setattr(temper_raylib, name, raypyc.Color(temper_obj.r, temper_obj.g, temper_obj.b, temper_obj.a))
                continue
            elif temper_obj in vars(typing).values():
                continue
            elif isinstance(temper_obj, type):
                if issubclass(temper_obj, BaseException):
                    continue
                if temper_obj in (abc.ABCMeta, bool, float, int, str, temper_raylib_raylib):
                    continue
                setattr(temper_raylib, name, getattr(raypyc, name))
                continue
            if name in demangle:
                raypyc_obj = getattr(raypyc, demangle[name])
                if callable(raypyc_obj):
                    setattr(temper_raylib, name, wrap_fast(raypyc_obj, temper_obj))
                else:
                    print('1', name, raypyc_obj)
            else:
                print('2', name, temper_obj)
    
    importlib.import_module(f'temper_raylib.demos.{argv[1]}').main(argv[2:])

if __name__ == '__main__':
    main()
