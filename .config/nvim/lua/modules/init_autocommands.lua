local M = {}

local main = function()
    vim.cmd([[
        augroup INIT
            autocmd!
            autocmd TermOpen * lua require("modules/init_term").term_open()
        augroup END
    ]])
end

main()

return M
