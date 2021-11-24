local lsp_setup = require("plugins/init_lsp_setup")

require("rust-tools").setup({ server = lsp_setup })
