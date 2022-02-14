local M = {}

local original_open_float = vim.diagnostic.open_float
function vim.diagnostic.open_float(opts, ...)
    opts = opts or {}
    opts.border = opts.border or "single"
    return original_open_float(opts, ...)
end

local main = function()
    vim.diagnostic.config({
        severity_sort = true,
        virtual_text = false
    })
end

main()

return M
