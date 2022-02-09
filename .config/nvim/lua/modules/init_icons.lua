local M = {
    U_2503 = "┃",
    U_25CF = "●",
}

M.icon = M.U_25CF

local diagnostic = function()
    vim.diagnostic.config({
        severity_sort = true,
    })
end

local gutter = function()
    local signs = { "Error", "Warn", "Hint", "Info" }
    for _, type in ipairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {
            text = M.icon,
            texthl = hl,
        })
    end
end

M.set_icons = function(arg)
    if arg.icon then
        arg.icon = M[arg.icon]
    else
        arg.icon = M.icon
    end
    local t = arg.result or arg.input
    local r = arg.result or {}
    for k, v in pairs(t) do
        arg.fn(r, k, v, arg.icon)
    end
    return r
end

M.init = function()
    diagnostic()
    gutter()
end

return M
