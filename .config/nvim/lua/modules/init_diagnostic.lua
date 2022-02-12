local M = {}

local original_open_float = vim.diagnostic.open_float
function vim.diagnostic.open_float(opts, ...)
    opts = opts or {}
    opts.border = opts.border or "single"
    return original_open_float(opts, ...)
end

return M
