local source = function(name)
    return { name, opt = false }
end

local M = {
    {
        "L3MON4D3/LuaSnip",
        opt = false,

        config = function()
            Error:guard(function()
                local set = vim.keymap.set
                local set_keymap = function(lhs, rhs, opts)
                    set({ "i", "s" }, lhs, rhs, opts)
                end

                local jump = Defer(require("luasnip").jump)
                set_keymap("<c-h>", jump(-1))
                set_keymap("<c-j>", jump(1))
            end)
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        opt = false,
        requires = {
            source("hrsh7th/cmp-buffer"),
            source("hrsh7th/cmp-nvim-lsp"),
            source("hrsh7th/cmp-path"),
        },

        config = function()
            Error:guard(function()
                local cmp = require("cmp")
                cmp.setup({
                    completion = {
                        completeopt = vim.o.completeopt,
                    },

                    formatting = {
                        format = function(entry, item)
                            item.menu = ({
                                buffer = "[Buffer]",
                                nvim_lsp = "[LSP]",
                                path = "[Path]",
                            })[entry.source.name]
                            return item
                        end,
                    },

                    mapping = cmp.mapping.preset.insert({
                        ["<c-space>"] = cmp.mapping.complete(),
                        ["<cr>"] = cmp.mapping.confirm({ select = false }),
                        ["<c-u>"] = cmp.mapping.scroll_docs(-4),
                        ["<c-d>"] = cmp.mapping.scroll_docs(4),
                    }),

                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body)
                        end,
                    },

                    sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                    }, {
                        { name = "path" },
                    }, {
                        {
                            name = "buffer",
                            option = {
                                get_bufnrs = function()
                                    return vim.api.nvim_list_bufs()
                                end,
                            },
                        },
                    }),

                    window = {
                        documentation = cmp.config.disable,
                    },
                })
            end)
        end,
    },
}

return M
