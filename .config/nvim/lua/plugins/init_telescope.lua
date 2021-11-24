require("telescope").setup({
    pickers = {
        file_browser = {
            disable_devicons = true,
            hidden = true,
        },
    },
})
require("telescope").load_extension("fzf")
