local coq = require("coq")
local lsp_status = require("plugins/init_lsp_status")

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    buf_set_keymap(
        "n",
        "<C-k>",
        "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        opts
    )
    buf_set_keymap(
        "n",
        "<space>D",
        "<cmd>lua vim.lsp.buf.type_definition()<cr>",
        opts
    )
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    buf_set_keymap(
        "n",
        "<space>ca",
        "<cmd>lua vim.lsp.buf.code_action()<cr>",
        opts
    )
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    buf_set_keymap(
        "n",
        "<space>e",
        "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>",
        opts
    )
    buf_set_keymap(
        "n",
        "[d",
        "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
        opts
    )
    buf_set_keymap(
        "n",
        "]d",
        "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
        opts
    )
    buf_set_keymap(
        "n",
        "<space>q",
        "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",
        opts
    )

    if client.resolved_capabilities.document_formatting then
        buf_set_keymap(
            "n",
            "<space>f",
            "<cmd>lua vim.lsp.buf.formatting()<cr>",
            opts
        )
    end
    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap(
            "v",
            "<space>f",
            "<cmd>lua vim.lsp.buf.range_formatting()<cr>",
            opts
        )
    end

    lsp_status.on_attach(client)
end

local init_lsp_setup = coq.lsp_ensure_capabilities({
    capabilities = lsp_status.capabilities,
    on_attach = on_attach,
    flags = { debounce_text_changes = 500 },
})

return init_lsp_setup
