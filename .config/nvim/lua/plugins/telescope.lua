local M = {
    telescope_fzf_native = {
        "nvim-telescope/telescope-fzf-native.nvim",
        module = {
            "telescope",
            "telescope.builtin",
        },
        run = "make",
    },

    telescope = {
        "nvim-telescope/telescope.nvim",
        after = "telescope-fzf-native.nvim",
        opt = false,
        requires = "plenary.nvim",
    },

    telescope_file_browser = {
        "nvim-telescope/telescope-file-browser.nvim",
        after = "telescope.nvim",
        opt = false,
    },
}

M.telescope.config = function()
    local telescope = require("telescope")
    local ivy = require("telescope/themes").get_ivy({
        layout_config = {
            height = 20,
        },
    })
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
    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")
end

local main = function()
    local set_keymap = vim.keymap.set
    local opts = { silent = true }

    local builtin = require("telescope/builtin")
    set_keymap("n", "<leader>ca", builtin.lsp_code_actions, opts)
    set_keymap("n", "<leader>fb", builtin.buffers, opts)
    set_keymap("n", "<leader>fe", builtin.builtin, opts)
    set_keymap("n", "<leader>ff", builtin.find_files, opts)
    set_keymap("n", "<leader>fh", builtin.help_tags, opts)
    set_keymap("n", "<leader>fr", builtin.live_grep, opts)

    local telescope = package.loaded.telescope
    set_keymap("n", "<leader>fn", telescope.extensions.file_browser.file_browser, opts)
end

pcall(main)

return M
