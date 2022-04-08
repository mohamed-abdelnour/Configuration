local M = {
    impatient = {
        "lewis6991/impatient.nvim",
        opt = false,
    },

    leap = {
        "ggandor/leap.nvim",
        opt = false,
        requires = "vim-repeat",
        config = function()
            require("leap").set_default_keymaps()
        end,
    },

    modus_vivendi = {
        "mohamed-abdelnour/modus_themes.nvim",
        config = function()
            require("modus_themes").vivendi()
        end,
        opt = false,
    },

    nvim_colorizer = {
        "norcalli/nvim-colorizer.lua",
        cmd = {
            "ColorizerAttachToBuffer",
            "ColorizerReloadAllBuffers",
            "ColorizerToggle",
        },
    },

    nvim_luapad = {
        "rafcamlet/nvim-luapad",
        cmd = {
            "LuaRun",
            "Luapad",
        },
    },

    plenary = {
        "nvim-lua/plenary.nvim",
        opt = false,
    },

    spaceless = {
        "lewis6991/spaceless.nvim",
        config = function()
            require("spaceless").setup()
        end,
        opt = false,
    },

    startuptime = {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    },

    vim_repeat = {
        "tpope/vim-repeat",
        opt = false,
    },

    which_key = {
        "folke/which-key.nvim",
        opt = false,
    },
}

M.startuptime.config = function()
    vim.g.startuptime_exe_args = {
        "-R",
        vim.fn.expand("%:p"),
    }
end

M.which_key.config = function()
    require("which-key").setup({
        plugins = {
            spelling = {
                enabled = true,
            },
        },
        window = {
            border = "single",
        },
    })
end

return M
