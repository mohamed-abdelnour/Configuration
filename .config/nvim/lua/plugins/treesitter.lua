local M = {
    {
        "lewis6991/spellsitter.nvim",
        opt = false,

        config = function()
            require("spellsitter").setup()
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opt = false,

        config = function()
            local disable = {
                "latex",
                "make",
            }

            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                    disable = disable,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_decremental = "grm",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                    },
                },
                rainbow = {
                    enable = true,
                    disable = disable,
                },
            })
        end,
    },

    {
        "nvim-treesitter/playground",
        opt = false,
    },

    {
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
        opt = false,
        requires = "nvim-treesitter",
    },
}

return M
