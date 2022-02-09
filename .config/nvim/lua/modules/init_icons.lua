local M = {
    U_2190 = "←",
    U_21AA = "↪",
    U_21D2 = "⇒",
    U_2503 = "┃",
    U_25B6 = "▶",
    U_25BC = "▼",
    U_25CB = "○",
    U_25CF = "●",
}

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
            text = M.U_25CF,
            texthl = hl,
        })
    end
end

M.overrides = {}

M.main = function()
    diagnostic()
    gutter()
end

return M
