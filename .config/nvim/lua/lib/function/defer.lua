local std = require("lib.std")

local M = {}

M.__index = M

M.__call = function(self, ...)
    local args = { ... }
    return function()
        return self.__f(std.unpack(args))
    end
end

return function(f)
    local t = { __f = f }
    return setmetatable(t, M)
end
