local source = function(name)
    return { name, opt = false }
end

local M = {
    cmp = {
        "hrsh7th/nvim-cmp",
        opt = false,
        requires = {
            source("hrsh7th/cmp-buffer"),
            source("hrsh7th/cmp-nvim-lsp"),
            source("hrsh7th/cmp-path"),
        },
    },

    luasnip = {
        "L3MON4D3/LuaSnip",
        opt = false,
    },
}

M.cmp.config = function()
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
end

M.luasnip.config = function()
    local set_keymap = function(key, f, opts)
        opts = opts or {}
        opts.silent = true
        vim.keymap.set({ "i", "s" }, key, f, opts)
    end

    local luasnip = require("luasnip")

    set_keymap("<tab>", function()
        if luasnip.expand_or_locally_jumpable() then
            luasnip.jump(1)
        else
            return "<tab>"
        end
    end, { expr = true })

    set_keymap("<s-tab>", function()
        luasnip.jump(-1)
    end)
end

return M
