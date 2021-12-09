require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_decremental = "grm",
            node_incremental = "grn",
            scope_incremental = "grc",
        },
    },
    rainbow = { enable = true },
})

function treesitter_section()
    return require("nvim-treesitter").statusline(40)
end
