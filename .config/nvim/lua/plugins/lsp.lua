local M = {
    {
        "j-hui/fidget.nvim",
        opt = false,

        config = function()
            Error:guard(function()
                require("fidget").setup({
                    window = {
                        blend = 0,
                        relative = "editor",
                    },
                })
            end)
        end,
    },

    {
        "neovim/nvim-lspconfig",
        opt = false,

        config = function()
            Error:guard(function()
                vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

                local init_server = require("modules.lsp").init_server

                Table.from({
                    { name = "hls" },
                    { name = "html" },
                    { name = "pyright" },
                    { name = "rnix" },
                })
                    :iter()
                    :for_each(init_server)
            end)
        end,
    },
}

return M
