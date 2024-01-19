local ffi = require('ffi')

local f = io.open('vendor/raylib-luajit/generated.h')

ffi.cdef(f:read('*all'))

local lib = ffi.load('vendor/raylib-luajit/libraylib.so')

local rl = require('vendor.raylib-luajit.generated')

rl.lib = lib

function rl.char_ptr(s)
    -- return ffi.new('const char[?]', string.len(s) + 1, s .. string.char(0))
    return s
end

return rl
