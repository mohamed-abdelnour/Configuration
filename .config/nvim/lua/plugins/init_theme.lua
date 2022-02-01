local M = {
    lush = {
        "rktjmp/lush.nvim",
        opt = false,
    },

    modus_vivendi = {
        "~/Projects/modus_vivendi",
        config = "vim.cmd([[colorscheme modus_vivendi]])",
        opt = false,
        requires = "lush.nvim",
    },
}

return M
