#!/usr/bin/env bash

set -ex

cc=clang
opt="-O1"

cd $(dirname ${BASH_SOURCE[0]})

# clone raylibs repositories
test -d raylib || git clone --depth 1 https://github.com/raysan5/raylib
test -d raygui || git clone --depth 1 https://github.com/raysan5/raygui

# compile raudio

test -f raylib/src/raudio-patch-is-done || cat extra_audio.c >> raylib/src/raudio.c && touch raylib/src/raudio-patch-is-done

# compile raylib as dynamic library
cd "./raylib/src"
make -Bj CC="$cc" PLATFORM=PLATFORM_DESKTOP RAYLIB_LIBTYPE=SHARED RAYLIB_MODULE_RAYGUI=TRUE GRAPHICS=GRAPHICS_API_OPENGL_43 CFLAGS+="$opt -DPLATFORM_DESKTOP -fPIC"
# shellcheck disable=SC2046
cp $(find . -name "libraylib.so.*.*.*") ../../../raypyc/libs/libraylib.so
make clean
cd ../..

# preprocess raylib headers
python3 rlhpp.py raylib/src/raylib.h RLAPI
python3 rlhpp.py raylib/src/raymath.h RMAPI
python3 rlhpp.py raylib/src/rlgl.h RLAPI
python3 rlhpp.py raygui/src/raygui.h RAYGUIAPI

# parse raylib headers
cp "./raylib/src/config.h" "./tmp/config.h.preprocessed"
cd raylib/parser
make raylib_parser
./raylib_parser --input "../../tmp/raylib.h.preprocessed" --output "../../../raypyc/raylib_api.json" --define RLAPI --format JSON
./raylib_parser --input "../../tmp/raymath.h.preprocessed" --output "../../../raypyc/raymath_api.json" --define RMAPI --format JSON
./raylib_parser --input "../../tmp/rlgl.h.preprocessed" --output "../../../raypyc/rlgl_api.json" --define RLAPI --format JSON
./raylib_parser --input "../../tmp/raygui.h.preprocessed" --output "../../../raypyc/raygui_api.json" --define RAYGUIAPI --format JSON
./raylib_parser --input "../../tmp/config.h.preprocessed" --output "../../../raypyc/config_api.json" --format JSON
cd ../..
rm -rf tmp raypyc_raygui.o
