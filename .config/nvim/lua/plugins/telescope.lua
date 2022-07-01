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

    telescope = {
        "nvim-telescope/telescope.nvim",
        opt = false,
        requires = "plenary.nvim",
    },
}

M.telescope.config = function()
    local telescope = require("telescope")
    local module = require("modules/telescope")

    local ivy = module.ivy
    telescope.setup({
        defaults = ivy,
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
    set_keymap("n", "<leader>fh", builtin.help_tags, opts)

    set_keymap("n", "<leader>ff", module.fd, opts)
    set_keymap("n", "<leader>fr", module.rg, opts)

    pcall(function()
        telescope.load_extension("file_browser")
        telescope.load_extension("fzf")

        set_keymap("n", "<leader>fn", telescope.extensions.file_browser.file_browser, opts)
    end)
end

return M
