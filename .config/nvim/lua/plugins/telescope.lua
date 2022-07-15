local M = {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        opt = false,
        run = "make",
    },

    {
        "nvim-telescope/telescope.nvim",
        opt = false,
        requires = "plenary.nvim",

        config = function()
            Error:guard(function()
                local telescope = require("telescope")
                local module = require("modules.telescope")

                local ivy = module.ivy
                telescope.setup({
                    defaults = ivy,
                })

                local set_keymap = vim.keymap.set

                local builtin = require("telescope.builtin")
                set_keymap("n", "<leader>fb", builtin.buffers)
                set_keymap("n", "<leader>fe", builtin.builtin)
                set_keymap("n", "<leader>fh", builtin.help_tags)

                set_keymap("n", "<leader>ff", module.fd)
                set_keymap("n", "<leader>fr", module.rg)

                telescope.load_extension("fzf")
            end)
        end,
    },
}

return M
