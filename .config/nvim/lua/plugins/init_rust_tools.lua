local lsp_setup = require("plugins/init_lsp").lsp_setup()

lsp_setup.settings = {
    ["rust-analyzer"] = {
        checkOnSave = {
            command = "clippy",
        },
    },
}

require("rust-tools").setup({
    tools = {
        inlay_hints = {
            parameter_hints_prefix = "← ",
            other_hints_prefix = "⇒ ",
        },
    },
    server = lsp_setup,
})
