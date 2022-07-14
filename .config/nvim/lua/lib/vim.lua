local M = vim

local original = {
    diagnostic = {
        open_float = M.diagnostic.open_float,
    },

    keymap = {
        set = M.keymap.set,
    },
}

function M.diagnostic.open_float(opts, ...)
    opts = opts or {}
    opts.border = opts.border or "single"
    return original.diagnostic.open_float(opts, ...)
end

function M.keymap.set(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = true
    original.keymap.set(mode, lhs, rhs, opts)
end

function M.keymap.buffer_set(buffer, mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = buffer
    M.keymap.set(mode, lhs, rhs, opts)
end

local main = function()
    M.diagnostic.config({
        severity_sort = true,
        virtual_text = false,
    })

    rawset(M.opt, "toggle", function(self, key, f)
        return function()
            f = f or function()
                return not self[key]:get()
            end
            self[key] = f()
        end
    end)
end

main()

return M
