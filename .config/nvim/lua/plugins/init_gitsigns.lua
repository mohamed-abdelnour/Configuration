local U2053 = "┃"

require("gitsigns").setup({
    signs = {
        add = {
            hl = "GitSignsAdd",
            linehl = "GitSignsAddLn",
            numhl = "GitSignsAddNr",
            text = U2053,
        },
        change = {
            hl = "GitSignsChange",
            linehl = "GitSignsChangeLn",
            numhl = "GitSignsChangeNr",
            text = U2053,
        },
        delete = {
            hl = "GitSignsDelete",
            linehl = "GitSignsDeleteLn",
            numhl = "GitSignsDeleteNr",
            text = U2053,
        },
        changedelete = {
            hl = "GitSignsChange",
            linehl = "GitSignsChangeLn",
            numhl = "GitSignsChangeNr",
            text = U2053,
        },
        topdelete = {
            hl = "GitSignsDelete",
            linehl = "GitSignsDeleteLn",
            numhl = "GitSignsDeleteNr",
            text = U2053,
        },
    },
})
