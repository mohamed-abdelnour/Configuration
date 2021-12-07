require("trouble").setup({
    fold_closed = ">",
    fold_open = "v",
    icons = false,
    indent_lines = false,
    signs = {
        error = "E",
        warning = "W",
        hint = "H",
        information = "I",
    },
    use_lsp_diagnostic_signs = false,
})
