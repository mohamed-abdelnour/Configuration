local M = {
    fidget = {
        "j-hui/fidget.nvim",
        opt = false,
    },

    lsp_config = {
        "neovim/nvim-lspconfig",
        after = "coq_nvim",
        opt = false,
    },
}

M.fidget.config = function()
    require("fidget").setup({
        window = {
            blend = 0,
            relative = "editor",
        },
    })
end

M.lsp_config.config = function()
    local servers = {
        { name = "hls" },
        { name = "html" },
        { name = "pyright" },
        { name = "rnix" },
    }

    local init_server = require("modules/lsp").init_server

    for _, server in ipairs(servers) do
        init_server(server)
    end
end

return M
