local M = {
    nvim_treesitter = {
        "nvim-treesitter/nvim-treesitter",
        opt = false,
    },

    nvim_treesitter_playground = {
        "nvim-treesitter/playground",
        opt = false,
    },

    nvim_ts_rainbow = {
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
        opt = false,
        requires = "nvim-treesitter",
    },

    spellsitter = {
        "lewis6991/spellsitter.nvim",
        config = function()
            require("spellsitter").setup()
        end,
        opt = false,
    },
}

M.nvim_treesitter.config = function()
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
end

return M
