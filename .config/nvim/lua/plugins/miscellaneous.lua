local M = {
    {
        "dstein64/vim-startuptime",
        cmd = "InitTime",

        config = function()
            Error:guard(function()
                vim.api.nvim_create_user_command("InitTime", function()
                    vim.g.startuptime_exe_args = { "-R", vim.fn.expand("%:p") }
                    vim.cmd("StartupTime")
                end, {})
            end)
        end,
    },

    {
        "ggandor/leap.nvim",
        opt = false,

        config = function()
            Error:guard(function()
                local leap = require("leap")
                leap.setup({ highlight_unlabeled = true })
                leap.set_default_keymaps()
            end)
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
            Error:guard(function()
                require("spaceless").setup()
            end)
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
            Error:guard(function()
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
            end)
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
            Error:guard(function()
                require("modus_themes").vivendi()
            end)
        end,
    },
}

return M
