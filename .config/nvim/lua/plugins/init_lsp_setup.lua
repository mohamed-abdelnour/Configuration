local coq = require("coq")
local lsp_status = require("plugins/init_lsp_status")

local on_attach = function(client, buffer)
    local function buf_set_keymap(lhs, rhs)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(buffer, "n", lhs, rhs, opts)
    end

    buf_set_keymap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    buf_set_keymap("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    buf_set_keymap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    buf_set_keymap("<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
    buf_set_keymap("<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>")
    buf_set_keymap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
    buf_set_keymap("<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>")
    buf_set_keymap("<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>")
    buf_set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
    buf_set_keymap("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>")
    buf_set_keymap("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>")
    buf_set_keymap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    buf_set_keymap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    buf_set_keymap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    buf_set_keymap("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    buf_set_keymap(
        "<leader>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>"
    )

    lsp_status.on_attach(client)
end

local init_lsp_setup = coq.lsp_ensure_capabilities({
    capabilities = lsp_status.capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 500 },
})

return init_lsp_setup
