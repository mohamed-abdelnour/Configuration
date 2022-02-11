local M = {}

local main = function()
    require("modules/init_term")
    vim.cmd([[
        augroup INIT
            autocmd!
            autocmd TermOpen * lua package.loaded["modules/init_term"].term_open()
        augroup END
    ]])
end

main()

return M
