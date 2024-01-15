#!/usr/bin/env python3

from logging import basicConfig, INFO

from sys import stdout

basicConfig(stream=stdout, level=INFO, format='%(message)s')

from sys import argv

import pyray as rl

import importlib

import glob

import random

from functools import lru_cache

from sys import path

if argv[1] == '--mypyc':
    argv = argv[1:]
    for i in glob.glob('temper.out/mypyc/*'):
        path.append(i)
else:
    for i in glob.glob('temper.out/py/*'):
        path.append(i)

import temper_raylib.rl.raylib as tray

def mangle(name):
    return name.replace('_3d', '3_d').replace('_2d', '2_d')

@lru_cache
def type_to_property_names(type_obj):
    ret = []
    for field_name in vars(type_obj):
        field = getattr(type_obj, field_name)
        if isinstance(field, property):
            ret.append(field_name)
    return tuple(ret)

@lru_cache(typed = True)
def object_to_dict(obj):
    if isinstance(obj, (dict, int, float, str)) or obj is None:
        return obj
    elif isinstance(obj, (list, tuple)):
        return tuple(map(object_to_dict, obj))
    else:
        return {field_name:object_to_dict(getattr(obj, field_name)) for field_name in type_to_property_names(type(obj))}

def wrap(func):
    if not callable(func):
        return func
    def inner(*args):
        return func(*map(object_to_dict, args))
    return inner

class Raylib:
    pass

def main():
    for name in vars(rl):
        if name.startswith('_'):
            continue
        if hasattr(rl, name):
            setattr(Raylib, mangle(name), wrap(getattr(rl, name)))

    tray.use(Raylib)

    importlib.import_module(f'temper_raylib.demos.{argv[1]}').main(argv[2:])

if __name__ == '__main__':
    main()
