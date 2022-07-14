local M = require("lib.table").default()

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
    self:iter():for_each(function(err)
        tostring(err):lines():for_each(M.notify)
    end)
end

return M
