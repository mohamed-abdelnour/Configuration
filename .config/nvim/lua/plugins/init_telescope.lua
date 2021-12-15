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
})
telescope.load_extension("fzf")
