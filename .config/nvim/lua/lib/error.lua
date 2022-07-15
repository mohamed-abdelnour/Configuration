require("lib.string")
local std = require("lib.std")

local meta = {
    __index = require("lib.table"),
}

function meta:__tostring()
    return tostring(self:iter()
        :map(function(message)
            return message:lines():map(string.expand_tabs):intersperse("\n")
        end)
        :intersperse("\n"))
end

local M = {}

function M:__guard(f, handler)
    local status, err = xpcall(f, debug.traceback)
    if not status then
        self:push(err)
        handler(err)
    end
    return status
end

M.notify = print

function M:aggregate(f)
    return self:__guard(f, std.identity)
end

function M:guard(f)
    return self:__guard(f, self.notify)
end

function M:notifier(notify)
    self.notify = notify
end

function M:report()
    self.notify(tostring(self))
end

setmetatable(M, meta)

return M
