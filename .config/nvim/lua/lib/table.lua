local Iterator = require("lib.iterator")

local M = {}

M.__index = M

function M:__tostring()
    return tostring(
        Iterator.once("["):chain(self:iter():intersperse(", ")):chain(Iterator.once("]"))
    )
end

function M.from(t)
    setmetatable(t, M)
    return t
end

function M.default()
    local t = {}
    return M.from(t)
end

function M:push(value)
    self[#self + 1] = value
end

function M:extend(iter)
    iter:for_each(function(item)
        self:push(item)
    end)
end

function M:iter()
    local i = 0
    return Iterator.from(function()
        i = i + 1
        return self[i]
    end)
end

return M
