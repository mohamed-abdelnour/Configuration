local lsp_setup = require("plugins/init_lsp_setup").lsp_setup()

require("rust-tools").setup({
    tools = {
        inlay_hints = {
            parameter_hints_prefix = "← ",
            other_hints_prefix = "⇒ ",
        },
    },
    server = lsp_setup,
})
