local M = {
    telescope = {
        "nvim-telescope/telescope.nvim",
        opt = false,
        requires = "plenary.nvim",
    },

    telescope_file_browser = {
        "nvim-telescope/telescope-file-browser.nvim",
        opt = false,
        requires = "telescope.nvim",
    },

    telescope_fzf_native = {
        "nvim-telescope/telescope-fzf-native.nvim",
        opt = false,
        requires = "telescope.nvim",
        run = "make",
    },
}

M.telescope.config = function()
    local set_keymap = vim.keymap.set
    local opts = { silent = true }

    set_keymap("n", "<leader>fb", [[<cmd>lua require("telescope.builtin").buffers()<cr>]], opts)
    set_keymap("n", "<leader>fe", [[<cmd>lua require("telescope.builtin").builtin()<cr>]], opts)
    set_keymap("n", "<leader>ff", [[<cmd>lua require("telescope.builtin").find_files()<cr>]], opts)
    set_keymap("n", "<leader>fh", [[<cmd>lua require("telescope.builtin").help_tags()<cr>]], opts)
    set_keymap("n", "<leader>fr", [[<cmd>lua require("telescope.builtin").live_grep()<cr>]], opts)

    set_keymap(
        "n",
        "<leader>fn",
        [[<cmd>lua require("telescope").extensions.file_browser.file_browser()<cr>]],
        opts
    )

    local telescope = require("telescope")
    telescope.setup({
        pickers = {
            find_files = {
                find_command = {
                    "fd",
                    "--hidden",
                    "--type",
                    "f",
                    "--strip-cwd-prefix",
                },
            },
        },
        extensions = {
            file_browser = {
                disable_devicons = true,
                hidden = true,
            },
        },
    })
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
end

return M
