
-- TEMPER_LUA_DEBUG_PCALL = true

package.path = package.path .. ';temper.out/lua/?.lua'

local temper_raylib = require('temper-raylib/rl/raylib')

local raylib = require('vendor.raylib-luajit.raylib')

local Color = temper_raylib.Color

for k,v in pairs(temper_raylib) do
    if k ~= 'Raylib' and k ~= 'use' then
        if type(v) == 'table' then
            if raylib[k] == nil then
                temper_raylib[k] = raylib.Color(v.r, v.g, v.b, v.a)
            else
                temper_raylib[k] = raylib[k]
            end
        elseif type(v) == 'function' then
            assert(raylib[k], k)
            temper_raylib[k] = raylib[k]
        elseif type(v) ~= 'number' and type(v) ~= 'string' then
            error(k)
        end
    end
end

if type(arg[1]) == 'string' then
    local demo = require('temper-raylib.demos.' .. arg[1])
    local args = {}
    for i=2, #arg do
        args[i-1] = arg[i]
    end
    demo.main(args)
end
