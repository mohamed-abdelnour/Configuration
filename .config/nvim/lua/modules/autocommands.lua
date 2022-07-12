local M = {}

local main = function()
    local api = vim.api
    api.nvim_create_augroup("INIT", { clear = true })
    api.nvim_create_autocmd("TermOpen", {
        group = "INIT",
        pattern = "*",
        callback = function()
            require("modules.term").term_open()
        end,
    })
end

main()

return M
