local M = {

    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = "cd app && yarn install",

        config = function()
            Error:guard(function()
                vim.keymap.set("n", "<leader>m", "<cmd>MarkdownPreviewToggle<cr>")
            end)
        end,
    },

    {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        ft = {
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
        },

        config = function()
            Error:guard(function()
                local ts_utils = require("nvim-lsp-ts-utils")
                require("modules.lsp").init_server({
                    name = "tsserver",
                    init_options = ts_utils.init_options,
                    hook = function(client, _)
                        ts_utils.setup({
                            auto_inlay_hints = false,
                            filter_out_diagnostics_by_code = { 80001 },
                        })
                        ts_utils.setup_client(client)
                    end,
                })
            end)
        end,
    },

    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
    },

    {
        "neovimhaskell/haskell-vim",
        ft = "haskell",
    },

    {
        "simrat39/rust-tools.nvim",
        ft = "rust",

        config = function()
            Error:guard(function()
                local lsp_setup = require("modules.lsp").lsp_setup()

                lsp_setup.settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                }

                local icons = require("modules.icons")
                local icon = function(k)
                    return icons[k] .. " "
                end

                require("rust-tools").setup({
                    tools = {
                        autoSetHints = false,
                        inlay_hints = {
                            highlight = "NonText",
                            other_hints_prefix = icon("U_21D2"),
                            parameter_hints_prefix = icon("U_2190"),
                        },
                    },
                    server = lsp_setup,
                })
            end)
        end,
    },
}

return M
