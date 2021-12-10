local lsp = require("lspconfig")
local setup = require("plugins/init_lsp_setup")

local function define_server(arg)
    return {
        name = arg.name,
        on_attach = arg.on_attach,
        settings = arg.settings,
    }
end

local function init_server(arg)
    local lsp_setup = setup.lsp_setup(arg.on_attach)
    lsp_setup.settings = arg.settings
    lsp[arg.name].setup(lsp_setup)
end

local servers = {
    define_server({
        name = "hls",
    }),
    define_server({
        name = "null-ls",
        on_attach = setup.base_on_attach,
    }),
    define_server({
        name = "pyright",
    }),
}

for _, server in ipairs(servers) do
    init_server({
        name = server.name,
        on_attach = server.on_attach,
        settings = server.settings,
    })
end
