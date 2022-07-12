local Iterator = require("lib.iterator")

local M = {}

M.__index = M

M.default = function()
    local t = {}
    setmetatable(t, M)
    return t
end

M.extend = function(self, iter)
    iter:for_each(function(item)
        self:push(item)
    end)
end

M.from = function(t)
    setmetatable(t, M)
    return t
end

M.iter = function(self)
    local i = 0
    return Iterator.from(function()
        i = i + 1
        return self[i]
    end)
end

M.push = function(self, value)
    self[#self + 1] = value
end

return M
