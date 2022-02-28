local M = {}

local main = function()
    vim.api.nvim_create_augroup({ name = "INIT", clear = true })
    vim.api.nvim_create_autocmd({
        group = "INIT",
        event = "TermOpen",
        pattern = "*",
        callback = function()
            package.loaded["modules/init_term"].term_open()
        end,
    })
end

main()

return M
