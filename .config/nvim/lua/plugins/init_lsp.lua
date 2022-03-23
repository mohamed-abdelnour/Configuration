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
    local extend = package.loaded["modules/init_functions"].extend
    require("lspconfig")

    local sumneko_lua = {
        name = "sumneko_lua",
        cmd = {
            "lua-language-server",
            table.concat({
                "--logpath=",
                vim.fn.stdpath("cache"),
                "/sumneko",
            }),
        },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = extend(vim.split(package.path, ";"), {
                        "lua/?.lua",
                        "lua/?/init.lua",
                    }),
                },
                diagnostics = {
                    disable = { "lowercase-global" },
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }

    local servers = {
        sumneko_lua,
        { name = "hls" },
        { name = "html" },
        { name = "pyright" },
        { name = "rnix" },
    }

    local init_server = package.loaded["modules/init_lsp"].init_server

    for _, server in ipairs(servers) do
        init_server(server)
    end
end

return M
