import raylibpy as raylib
import sys
import os

for ent in os.listdir('temper.out/py'):
    sys.path.append('temper.out/py/' + ent)

import temper_raylib.rl.raylib as traylib

def make_iter(the_type):
    if not isinstance(the_type, type) or the_type in [str, int, bool, float]:
        return

    def inner(self):
        return iter(getattr(self, index) for index in the_type.__slots__)
    
    try:
        the_type.__iter__ = inner
        return True
    except Exception:
        return False
        
pairs = vars(traylib)

for key in pairs:
    make_iter(pairs[key])

def main():
    traylib.use(raylib)
    import temper_raylib.app

if __name__ == '__main__':
    main()

