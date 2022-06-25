local M = {
    fzf_native = {
        "nvim-telescope/telescope-fzf-native.nvim",
        opt = false,
        run = "make",
    },

    file_browser = {
        "nvim-telescope/telescope-file-browser.nvim",
        opt = false,
    },

    live_grep_args = {
        "nvim-telescope/telescope-live-grep-args.nvim",
        opt = false,
    },

    telescope = {
        "nvim-telescope/telescope.nvim",
        opt = false,
        requires = "plenary.nvim",
    },
}

M.telescope.config = function()
    local telescope = require("telescope")

    local ivy = require("modules/telescope").ivy()
    telescope.setup({
        defaults = ivy,
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
                respect_gitignore = false,
            },
        },
    })

    local set_keymap = vim.keymap.set
    local opts = { silent = true }

    local builtin = require("telescope/builtin")
    set_keymap("n", "<leader>fb", builtin.buffers, opts)
    set_keymap("n", "<leader>fe", builtin.builtin, opts)
    set_keymap("n", "<leader>ff", builtin.find_files, opts)
    set_keymap("n", "<leader>fh", builtin.help_tags, opts)

    pcall(function()
        telescope.load_extension("file_browser")
        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")

        set_keymap("n", "<leader>fn", telescope.extensions.file_browser.file_browser, opts)
        set_keymap("n", "<leader>fr", telescope.extensions.live_grep_args.live_grep_args, opts)
    end)
end

return M
