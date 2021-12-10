local M = {}

local coq = require("coq")

local function buf_set_keymap(lhs, rhs)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(buffer, "n", lhs, rhs, opts)
end

M.base_on_attach = function(client, buffer)
    buf_set_keymap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    buf_set_keymap("<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>")
    buf_set_keymap("<leader>n", "<cmd>lua vim.lsp.buf.formatting()<cr>")
    buf_set_keymap("<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>")
    buf_set_keymap("[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
    buf_set_keymap("]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
end

M.full_on_attach = function(client, buffer)
    M.base_on_attach(client, buffer)

    buf_set_keymap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    buf_set_keymap("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    buf_set_keymap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
    buf_set_keymap("<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>")
    buf_set_keymap("<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>")
    buf_set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
    buf_set_keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    buf_set_keymap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    buf_set_keymap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    buf_set_keymap("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    buf_set_keymap(
        "<leader>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>"
    )

    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_setup = function(on_attach)
    return coq.lsp_ensure_capabilities({
        on_attach = on_attach or M.full_on_attach,
        flags = { debounce_text_changes = 150 },
    })
end

return M
