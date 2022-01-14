local telescope = require("telescope")
telescope.setup({
    pickers = {
        file_browser = {
            disable_devicons = true,
            hidden = true,
        },
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
