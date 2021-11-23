local lsp = require("lspconfig")
local lsp_setup = require("plugins/init-lsp-setup")

local servers = { "hls", "pyright", "rust_analyzer" }
for _, server in ipairs(servers) do
    lsp[server].setup(lsp_setup)
end
