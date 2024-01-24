local ffi = require('ffi')

local f = io.open('vendor/raylib-luajit/generated.h')

ffi.cdef(f:read('*all'))

local lib = ffi.load('vendor/raylib-luajit/libraylib.so')

local rl = require('vendor.raylib-luajit.generated')

return rl(lib)
