local lsp_status = require("lsp-status")

lsp_status.register_progress()
lsp_status.config({
    indicator_errors = "E",
    indicator_hint = "H",
    indicator_info = "I",
    indicator_ok = "OK",
    indicator_warnings = "W",
    status_symbol = "",
})

function lsp_section()
    return lsp_status.status():gsub("^%s*(.-)%s*$", "[%1]")
end

local statusline = require("init_functions").statusline
vim.opt.statusline = [[%!luaeval("statusline(lsp_section())")]]

return lsp_status
