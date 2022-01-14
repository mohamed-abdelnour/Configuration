vim.g.did_load_filetypes = 1

require("filetype").setup({
    overrides = {
        extensions = {
            ejs = "html",
            xinitrc = "sh",
        },
        literal = {
            ["fonts.conf"] = "xml",
        },
        shebang = {
            dash = "sh",
        },
    },
})
