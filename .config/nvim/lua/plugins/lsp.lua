local M = {
    fidget = {
        "j-hui/fidget.nvim",
        opt = false,
    },

    lsp_config = {
        "neovim/nvim-lspconfig",
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
    vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

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
