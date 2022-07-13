local M = require("lib.table").default()

M.guard = function(self, f)
    local status, err = xpcall(f, debug.traceback)
    if not status then
        self:push(err)
    end
    return status
end

M.notify = print

M.notifier = function(self, notify)
    self.notify = notify
end

M.report = function(self)
    self:iter():for_each(function(err)
        tostring(err):lines():for_each(M.notify)
    end)
end

return M
