local M = {
    filetype = {
        "nathom/filetype.nvim",
        opt = false,
    },
}

M.filetype.config = function()
    vim.g.did_load_filetypes = 1

    require("filetype").setup({
        overrides = {
            extensions = {
                ejs = "html",
                xinitrc = "sh",
            },
            literal = {
                ["fonts.conf"] = "xml",
                ["tmux.conf"] = "sh",
            },
            shebang = {
                dash = "sh",
            },
        },
    })
end

return M
