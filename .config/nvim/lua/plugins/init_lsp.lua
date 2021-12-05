local lsp = require("lspconfig")
local lsp_setup = require("plugins/init_lsp_setup")

local function define_server(server, settings)
    return { server = server, settings = settings or {} }
end

local function init_server(server, settings)
    lsp_setup.settings = settings or {}
    lsp[server].setup(lsp_setup)
end

local servers = {
    define_server("hls"),
    define_server("pyright"),
}

for _, server in ipairs(servers) do
    init_server(server.server, server.settings)
end
