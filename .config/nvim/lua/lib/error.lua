require("lib.string")
local std = require("lib.std")

local meta = {
    __index = require("lib.table"),
}

meta.__tostring = function(self)
    return tostring(self:iter()
        :map(function(message)
            return message:lines():map(string.expand_tabs):intersperse("\n")
        end)
        :intersperse("\n"))
end

local M = {}

M.__guard = function(self, f, handler)
    local status, err = xpcall(f, debug.traceback)
    if not status then
        self:push(err)
        handler(err)
    end
    return status
end

M.notify = print

M.aggregate = function(self, f)
    return self:__guard(f, std.identity)
end

M.guard = function(self, f)
    return self:__guard(f, self.notify)
end

M.notifier = function(self, notify)
    self.notify = notify
end

M.report = function(self)
    self.notify(tostring(self))
end

setmetatable(M, meta)

return M
