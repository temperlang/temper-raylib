import raylibpy as raylib
import sys
import os

for ent in os.listdir('temper.out/py'):
    sys.path.append('temper.out/py/' + ent)

from temper_raylib.start import start
import temper_raylib.rl.types as types

def make_iter(the_type):
    if not isinstance(the_type, type) or the_type in [str, int, bool, float]:
        return

    def inner(self):
        return iter(getattr(self, index) for index in the_type.__slots__)
    
    the_type.__iter__ = inner

pairs = vars(types)

for key in pairs:
    make_iter(pairs[key])

def main():
    start(raylib)

if __name__ == '__main__':
    main()

