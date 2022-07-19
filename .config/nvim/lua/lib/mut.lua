local M = {}

M.__index = M

function M.new(t)
    return setmetatable(t, M)
end

function M.from(value)
    local t = { __inner = value }
    return M.new(t)
end

function M:get()
    return self.__inner
end

function M:replace(src)
    local value = self.__inner
    self.__inner = src
    return value
end

function M:take()
    return self:replace()
end

return M
