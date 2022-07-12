require("lib.string")
local Iterator = require("lib.iterator")

local M = {}

M.__index = M

M.args = function(self)
    return Iterator.from(self:iter()):collect()
end

M.capture = function(pattern, left, right)
    left = left or ""
    right = right or left
    return table.concat({ "^%s*", left, "(", pattern, ")", right })
end

M.extract = function(self, pattern, left, right)
    local _, last, match = self.inner:find(self.capture(pattern, left, right))
    last = last or 0

    self.inner = self.inner:sub(last + 1)
    return match
end

M.from = function(inner)
    local t = { inner = inner }
    setmetatable(t, M)
    return t
end

M.iter = function(self)
    return function()
        return self:quoted() or self:extract("%S+")
    end
end

M.quoted = function(self)
    local quote = function(left)
        return self:extract(".-", left)
    end

    local expand = function(left)
        local query = quote(left)
        return query and query:shell_expand()
    end

    return quote("'") or expand([["]])
end

return M
