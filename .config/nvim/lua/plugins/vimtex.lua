local M = {
    {
        "lervag/vimtex",
        ft = "tex",
        config = function()
            local set_keymap = vim.keymap.set

            set_keymap("n", "<leader>lc", "<cmd>VimtexClean<cr>")
            set_keymap("n", "<leader>lC", "<cmd>VimtexClean!<cr>")
            set_keymap("n", "<leader>ll", "<cmd>VimtexCompileSS<cr>")

            local global = vim.g

            global.tex_flavor = "latex"
            global.tex_indent_brace = 0
            global.tex_indent_items = 0

            global.vimtex_compiler_latexmk = {
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
            global.vimtex_mappings_enabled = 0
            global.vimtex_matchparen_enabled = 0
        end,
    },
}

return M
