local init_rust_tools = {}

local lsp_setup = require("plugins/init-lsp-setup")

require("rust-tools").setup({ server = lsp_setup })

return init_rust_tools
