# temper-raylib
Raylib Bindings for Temper

Based on the json version of the C header for [raylib].

# Building

To build temper-raylib, make sure you have both python3 and temper on your path.

First generate the raylib bindings for temper.
```sh
python3 -m rl.raylib
```

Then Build the temper files into a library.
```
temper build
```

# Running

Temper supports multiple backends for temper-raylib, currently `py` and `js` work.

```sh
python3 -m pip install raylib-py
python3 main.py
```

```sh
npm i
node main.js
```

[raylib]: https://www.raylib.com/
