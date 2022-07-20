local M = {}

M.__index = M

M.new = function(t)
    return setmetatable(t, M)
end

M.from = function(value)
    local t = { __inner = value }
    return M.new(t)
end

M.get = function(self)
    return self.__inner
end

M.replace = function(self, src)
    local value = self.__inner
    self.__inner = src
    return value
end

M.take = function(self)
    return self:replace()
end

return M
