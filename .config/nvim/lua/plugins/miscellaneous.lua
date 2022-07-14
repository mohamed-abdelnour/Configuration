local M = {
    {
        "ggandor/leap.nvim",
        opt = false,

        config = function()
            local leap = require("leap")
            leap.setup({ highlight_unlabeled = true })
            leap.set_default_keymaps()
        end,
    },

    {
        "lewis6991/impatient.nvim",
        opt = false,
    },

    {
        "lewis6991/spaceless.nvim",
        opt = false,

        config = function()
            require("spaceless").setup()
        end,
    },

    {
        "nvim-lua/plenary.nvim",
        opt = false,
    },

    {
        "stevearc/dressing.nvim",
        opt = false,
        requires = "telescope.nvim",

        config = function()
            require("dressing").setup({
                input = {
                    insert_only = false,
                    winblend = 0,
                },
                select = {
                    backend = { "telescope" },
                    telescope = require("modules.telescope").ivy,
                },
            })
        end,
    },

    {
        "tpope/vim-repeat",
        opt = false,
    },

    {
        "~/Projects/modus_themes.nvim",
        opt = false,

        config = function()
            require("modus_themes").vivendi()
        end,
    },
}

return M
