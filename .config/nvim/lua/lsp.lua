local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",
                       opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<space>f",
                       "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    require('completion').on_attach()
end

local servers = {'hls', 'jdtls', 'pyright', 'rnix', 'rust_analyzer', 'texlab'}
for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end
