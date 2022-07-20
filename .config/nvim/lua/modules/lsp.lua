local cmp_lsp = require("cmp_nvim_lsp")
local lsp = require("lspconfig")

local M = {}

M.format = function()
    vim.lsp.buf.format({
        async = true,
        name = "null-ls",
    })
end

M.rename = function()
    vim.lsp.buf.rename(nil, {
        filter = function(client)
            return client.name ~= "null-ls"
        end,
    })
end

M.on_attach = function(client, buffer, arg)
    arg = arg or {}

    local set_keymap = function(lhs, rhs)
        vim.keymap.buffer_set(buffer, "n", lhs, rhs)
    end

    local base = function()
        set_keymap("<leader>ca", vim.lsp.buf.code_action)
        set_keymap("<leader>e", vim.diagnostic.open_float)
        set_keymap("<leader>n", M.format)
        set_keymap("<leader>q", vim.diagnostic.setloclist)
        set_keymap("[d", vim.diagnostic.goto_prev)
        set_keymap("]d", vim.diagnostic.goto_next)

        if arg.hook then
            arg.hook(client, buffer)
        end
    end

    local full = function()
        base()

        set_keymap("<C-k>", vim.lsp.buf.signature_help)
        set_keymap("<leader>D", vim.lsp.buf.type_definition)
        set_keymap("<leader>rn", M.rename)
        set_keymap("<leader>wa", vim.lsp.buf.add_workspace_folder)
        set_keymap("<leader>wr", vim.lsp.buf.remove_workspace_folder)
        set_keymap("K", vim.lsp.buf.hover)
        set_keymap("gD", vim.lsp.buf.declaration)
        set_keymap("gd", vim.lsp.buf.definition)
        set_keymap("gi", vim.lsp.buf.implementation)
        set_keymap("gr", vim.lsp.buf.references)
        set_keymap("<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end)
    end

    return {
        base = base,
        full = full,
    }
end

M.lsp_setup = function(arg)
    arg = arg or {}

    local defaults = vim.lsp.protocol.make_client_capabilities()
    defaults.on_attach = function(client, buffer)
        M.on_attach(client, buffer, arg).full()
    end

    return cmp_lsp.update_capabilities(vim.tbl_extend("keep", arg, defaults))
end

M.init_server = function(arg)
    lsp[arg.name].setup(M.lsp_setup(arg))
end

return M
