local M = {}

M.__index = M

M.__call = function(self)
    return self:next()
end

M.collect = function(self)
    local t = require("lib.table").default()
    self:for_each(function(item)
        t:push(item)
    end)
    return t
end

M.extend = function(self, other)
    return M.from(function()
        return self() or other()
    end)
end

M.for_each = function(self, f)
    for item in self do
        f(item)
    end
end

M.from = function(next)
    local t = { next = next }
    setmetatable(t, M)
    return t
end

M.intersperse = function(self, separator)
    self = self:peekable()
    local needs_sep = false
    return M.from(function()
        if needs_sep and self:peek() then
            needs_sep = false
            return separator
        else
            needs_sep = true
            return self()
        end
    end)
end

M.map = function(self, f)
    return M.from(function()
        local t = self()
        return t and f(t)
    end)
end

M.new = function(t)
    setmetatable(t, M)
    return t
end

M.peekable = function(self)
    return M.new({
        next = function(iter)
            return iter:take() or self()
        end,

        peek = function(iter)
            iter.peeked = iter()
            return iter.peeked
        end,

        take = function(iter)
            local peeked = iter.peeked
            iter.peeked = nil
            return peeked
        end,
    })
end

return M
