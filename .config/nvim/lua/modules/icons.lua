local M = {
    U_2190 = "←",
    U_2192 = "→",
    U_21AA = "↪",
    U_21D2 = "⇒",
    U_2503 = "┃",
    U_25B6 = "▶",
    U_25BC = "▼",
    U_25CF = "●",
}

local main = function()
    Table.from({ "Error", "Warn", "Hint", "Info" }):iter():for_each(function(type)
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {
            text = M.U_25CF,
            texthl = hl,
        })
    end)
end

main()

return M
