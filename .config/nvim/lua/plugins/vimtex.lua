local M = {
    vimtex = {
        "lervag/vimtex",
        ft = "tex",
    },
}

M.vimtex.config = function()
    local set_keymap = vim.keymap.set
    local opts = { silent = true }

    set_keymap("n", "<leader>lc", "<cmd>VimtexClean<cr>", opts)
    set_keymap("n", "<leader>lC", "<cmd>VimtexClean!<cr>", opts)
    set_keymap("n", "<leader>ll", "<cmd>VimtexCompileSS<cr>", opts)

    vim.g.tex_flavor = "latex"
    vim.g.tex_indent_brace = 0
    vim.g.tex_indent_items = 0

    vim.g.vimtex_compiler_latexmk = {
        build_dir = "",
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        hooks = {},
        options = {
            "-file-line-error",
            "-interaction=nonstopmode",
            "-synctex=0",
            "-verbose",
        },
    }
    vim.g.vimtex_mappings_enabled = 0
    vim.g.vimtex_matchparen_enabled = 0
end

return M