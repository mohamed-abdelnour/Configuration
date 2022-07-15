require("lib.string")

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

M.notify = print

function M:guard(f)
    local status, err = xpcall(f, debug.traceback)
    if not status then
        self:push(err)
    end
    return status
end

function M:notifier(notify)
    self.notify = notify
end

function M:report()
    M.notify(tostring(self))
end

setmetatable(M, meta)

return M
