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

function M:__call()
    return self:next()
end

function M:__tostring()
    return table.concat(self:map(tostring):collect())
end

-- Producers
function M.new(t)
    return setmetatable(t, M)
end

function M.from(next)
    local t = { next = next }
    return M.new(t)
end

M.empty = Defer(M.from)(std.nop)

function M.once(value)
    return M.new(Once(value))
end

-- Consumers
function M:for_each(f)
    for item in self do
        f(item)
    end
end

function M:collect()
    local t = require("lib.table").default()
    self:for_each(function(item)
        t:push(item)
    end)
    return t
end

-- Adapters
function M:chain(other)
    return M.new(Chain(self, other))
end

function M:intersperse(separator)
    return M.new(Intersperse(self, separator))
end

function M:map(f)
    return M.new(Map(self, f))
end

function M:peekable()
    return M.new(Peekable(self))
end

return M
