# temper-raylib
Raylib Bindings for Temper

Based on the json version of the C header for [raylib].

# Building

To build temper-raylib, make sure you have both python3 and temper on your path.

First generate the raylib bindings for temper.
```sh
python3 rl/gen.py
```

Then Build the temper files into a library.
```
temper build -b js -b py
```

# Running

Temper supports multiple backends for temper-raylib, currently `py` and `js` work.

```sh
python3 -m pip install raylib
python3 launch-pyray.py pong
```

```sh
python3 -m pip install vendor/raypyc
python3 launch-raypyc.py conway

```

```sh
npm i
node launch.js conway
```

[raylib]: https://www.raylib.com/
