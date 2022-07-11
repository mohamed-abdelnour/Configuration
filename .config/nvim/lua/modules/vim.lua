local original = {
    diagnostic = {
        open_float = vim.diagnostic.open_float,
    },

    keymap = {
        set = vim.keymap.set,
    },
}

local M = vim

M.diagnostic.open_float = function(opts, ...)
    opts = opts or {}
    opts.border = opts.border or "single"
    return original.diagnostic.open_float(opts, ...)
end

M.keymap.set = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = true
    original.keymap.set(mode, lhs, rhs, opts)
end

M.keymap.buffer_set = function(buffer, mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = buffer
    M.keymap.set(mode, lhs, rhs, opts)
end

local main = function()
    M.diagnostic.config({
        severity_sort = true,
        virtual_text = false,
    })
end

main()

return M
