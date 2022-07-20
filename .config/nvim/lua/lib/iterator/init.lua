local Defer = require("lib.function.defer")
local std = require("lib.std")

local Once = require("lib.iterator.constructor.once")

local Chain = require("lib.iterator.adapter.chain")
local Intersperse = require("lib.iterator.adapter.intersperse")
local Map = require("lib.iterator.adapter.map")
local Peekable = require("lib.iterator.adapter.peekable")

local M = {}

-- Metamethods
M.__index = M

M.__call = function(self)
    return self:next()
end

M.__tostring = function(self)
    return table.concat(self:map(tostring):collect())
end

-- Producers
M.new = function(t)
    return setmetatable(t, M)
end

M.from = function(next)
    local t = { next = next }
    return M.new(t)
end

M.empty = Defer(M.from)(std.nop)

M.once = function(value)
    return M.new(Once(value))
end

-- Consumers
M.for_each = function(self, f)
    for item in self do
        f(item)
    end
end

M.collect = function(self)
    local t = require("lib.table").default()
    self:for_each(function(item)
        t:push(item)
    end)
    return t
end

-- Adapters
M.chain = function(self, other)
    return M.new(Chain(self, other))
end

M.intersperse = function(self, separator)
    return M.new(Intersperse(self, separator))
end

M.map = function(self, f)
    return M.new(Map(self, f))
end

M.peekable = function(self)
    return M.new(Peekable(self))
end

return M
