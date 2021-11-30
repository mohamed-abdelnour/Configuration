require("nvim-treesitter.configs").setup({
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
