local M = {}

M.__index = M

function M:__call(...)
    local args = ...
    return function()
        return self.__f(args)
    end
end

return function(f)
    local t = { __f = f }
    setmetatable(t, M)
    return t
end
