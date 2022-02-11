local M = {
    trouble = {
        "folke/trouble.nvim",
        cmd = "Trouble",
    },
}

M.trouble.config = function()
    local icons = package.loaded["modules/init_icons"]
    require("trouble").setup({
        fold_closed = icons.U_25B6,
        fold_open = icons.U_25BC,
        icons = false,
        use_diagnostic_signs = true,
    })
end

local main = function()
    local set_keymap = vim.keymap.set
    local opts = { silent = true }

    set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
    set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opts)
    set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opts)
    set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
    set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
    set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
end

main()

return M
