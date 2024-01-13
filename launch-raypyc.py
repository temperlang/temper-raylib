#!/usr/bin/env python3

from sys import argv, path

import raypyc as rl

import importlib

import glob

from functools import lru_cache

from inspect import signature

from types import SimpleNamespace

for i in glob.glob('temper.out/py/*'):
    path.append(i)

import temper_raylib.rl.raylib as temper_raylib

def mangle(name: str) -> str:
    return name.replace('_3d', '3_d').replace('_2d', '2_d')

@lru_cache
def type_to_property_names(type_obj: type) -> tuple[str, ...]:
    ret = []
    for field_name in vars(type_obj):
        field = getattr(type_obj, field_name)
        if isinstance(field, property):
            ret.append(field_name)
    # print(type_obj, *ret)
    return tuple(ret)

@lru_cache
def ctype_to_property_names(ctype_obj) -> tuple[str, ...]:
    return ctype_obj._fields_

@lru_cache(typed = True)
def object_to_dict(obj: object) -> dict | int | float | str | list  | tuple:
    if isinstance(obj, (int, float, str)) or obj is None:
        return obj
    elif isinstance(obj, (list, tuple)):
        return tuple(map(object_to_dict, obj))
    else:
        return {field_name:object_to_dict(getattr(obj, field_name)) for field_name in type_to_property_names(type(obj))}

@lru_cache(typed = True)
def object_to_ctype(obj, ctype):
    if isinstance(obj, (int, float)):
        return ctype(obj)
    elif isinstance(obj, str):
        return ctype(obj.encode('utf-8'))
    elif isinstance(obj, (list, tuple)):
        return tuple(object_to_ctype())
    else:
        dict_obj = {field_name:object_to_ctype(getattr(obj, field_name), field_ctype) for field_name, field_ctype in ctype_to_property_names(ctype)}
        return ctype(**dict_obj)
        # return {field_name:object_to_ctype(getattr(obj, field_name)) for field_name in type_to_property_names(ctype)}

def wrap(func):
    if not callable(func):
        return func
    if hasattr(func, 'argtypes'):
        argtypes = func.argtypes
        def inner(*args):
            new_args = tuple(object_to_ctype(arg, ctype) for arg, ctype in zip(args, argtypes))
            # print(dir(func), func)
            return func(*new_args)
    else:
        inner = func
        # def inner(*args):
        #     new_args = tuple(object_to_dict(arg) for arg in args)
        #     return func(*new_args)
    return inner


def main():
    wrapped_raylib = SimpleNamespace()

    for name in vars(rl):
        if name.startswith('_'):
            continue
        if hasattr(rl, name):
            setattr(wrapped_raylib, mangle(name), wrap(getattr(rl, name)))

    temper_raylib.use(wrapped_raylib)
    
    importlib.import_module(f'temper_raylib.games.{argv[1]}').main(argv[2:])

if __name__ == '__main__':
    main()
