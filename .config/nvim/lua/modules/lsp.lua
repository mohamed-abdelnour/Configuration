local M = {}

M.format = function()
    vim.lsp.buf.format({
        async = true,
        filter = function(clients)
            return vim.tbl_filter(function(client)
                return client.name == "null-ls"
            end, clients)
        end,
    })
end

M.on_attach = function(client, buffer, arg)
    arg = arg or {}

    local buf_set_keymap = function(lhs, rhs)
        local opts = { buffer = buffer, silent = true }
        vim.keymap.set("n", lhs, rhs, opts)
    end

    local base = function()
        buf_set_keymap("<leader>ca", vim.lsp.buf.code_action)
        buf_set_keymap("<leader>e", vim.diagnostic.open_float)
        buf_set_keymap("<leader>n", M.format)
        buf_set_keymap("<leader>q", vim.diagnostic.setloclist)
        buf_set_keymap("[d", vim.diagnostic.goto_prev)
        buf_set_keymap("]d", vim.diagnostic.goto_next)

        if arg.hook then
            arg.hook(client, buffer)
        end
    end

    local full = function()
        base()

        buf_set_keymap("<C-k>", vim.lsp.buf.signature_help)
        buf_set_keymap("<leader>D", vim.lsp.buf.type_definition)
        buf_set_keymap("<leader>rn", vim.lsp.buf.rename)
        buf_set_keymap("<leader>wa", vim.lsp.buf.add_workspace_folder)
        buf_set_keymap("<leader>wr", vim.lsp.buf.remove_workspace_folder)
        buf_set_keymap("K", vim.lsp.buf.hover)
        buf_set_keymap("gD", vim.lsp.buf.declaration)
        buf_set_keymap("gd", vim.lsp.buf.definition)
        buf_set_keymap("gi", vim.lsp.buf.implementation)
        buf_set_keymap("gr", vim.lsp.buf.references)
        buf_set_keymap("<leader>wl", function()
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

    local defaults = {
        on_attach = function(client, buffer)
            M.on_attach(client, buffer, arg).full()
        end,
        flags = {
            debounce_text_changes = 150,
        },
    }
    local coq = require("coq")
    return coq.lsp_ensure_capabilities(vim.tbl_extend("keep", arg, defaults))
end

M.init_server = function(arg)
    local lsp_setup = vim.tbl_extend("keep", M.lsp_setup(arg), arg)
    local lsp = require("lspconfig")
    lsp[arg.name].setup(lsp_setup)
end

return M
