local M = {}

local main = function()
    vim.api.nvim_create_augroup("INIT", { clear = true })
    vim.api.nvim_create_autocmd("TermOpen", {
        group = "INIT",
        pattern = "*",
        callback = function()
            package.loaded["modules/init_term"].term_open()
        end,
    })
end

main()

return M
