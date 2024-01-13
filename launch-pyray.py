#!/usr/bin/env python3

from sys import argv as args

import pyray as rl

import importlib

import sys

import glob

from functools import lru_cache

for i in glob.glob('temper.out/py/*'):
    sys.path.append(i)

import temper_raylib.rl.raylib as tray

def mangle(name: str) -> str:
    return name.replace('_3d', '3_d').replace('_2d', '2_d')

@lru_cache
def type_to_property_names(type_obj: type) -> tuple[str, ...]:
    ret = []
    for field_name in vars(type_obj):
        field = getattr(type_obj, field_name)
        if isinstance(field, property):
            ret.append(field_name)
    return tuple(ret)

@lru_cache(typed = True)
def object_to_dict(obj: object) -> dict | int | float | str | list  | tuple:
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

    importlib.import_module(f'temper_raylib.games.{args[1]}').main(args[2:])

if __name__ == '__main__':
    main()
