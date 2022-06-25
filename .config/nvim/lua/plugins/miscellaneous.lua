local M = {
    impatient = {
        "lewis6991/impatient.nvim",
        opt = false,
    },

    dressing = {
        "stevearc/dressing.nvim",
        opt = false,
        requires = "telescope.nvim",
    },

    leap = {
        "ggandor/leap.nvim",
        opt = false,
    },

    modus_vivendi = {
        "~/Projects/modus_themes.nvim",
        config = function()
            require("modus_themes").vivendi()
        end,
        opt = false,
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
}

M.dressing.config = function()
    require("dressing").setup({
        input = {
            insert_only = false,
            winblend = 0,
        },
        select = {
            backend = { "telescope" },
            telescope = require("modules/telescope").ivy(),
        },
    })
end

M.leap.config = function()
    local leap = require("leap")
    leap.setup({ highlight_unlabeled = true })
    leap.set_default_keymaps()
end

return M
