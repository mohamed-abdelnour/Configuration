local std = require("lib.std")

local M = {}

M.__index = M

function M:__call(...)
    local args = { ... }
    return function()
        return self.__f(std.unpack(args))
    end
end

return function(f)
    local t = { __f = f }
    setmetatable(t, M)
    return t
end
