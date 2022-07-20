local Iterator = require("lib.iterator")

local M = {}

M.__index = M

M.__tostring = function(self)
    return tostring(
        Iterator.once("["):chain(self:iter():intersperse(", ")):chain(Iterator.once("]"))
    )
end

M.from = function(t)
    return setmetatable(t, M)
end

M.default = function()
    local t = {}
    return M.from(t)
end

M.push = function(self, value)
    self[#self + 1] = value
end

M.extend = function(self, iter)
    iter:for_each(function(item)
        self:push(item)
    end)
end

M.iter = function(self)
    local i = 0
    return Iterator.from(function()
        i = i + 1
        return self[i]
    end)
end

return M
