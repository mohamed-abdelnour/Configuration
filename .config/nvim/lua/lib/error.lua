local M = require("lib.table").default()

M.guard = function(self, f)
    local status, err = pcall(f)
    if not status then
        self:push(err)
    end
end

M.report = function(self)
    local writeln = vim.api.nvim_err_writeln
    self:iter():for_each(function(t)
        tostring(t):lines():map(vim.trim):for_each(writeln)
    end)
end

return M
