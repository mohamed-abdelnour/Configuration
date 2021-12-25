local M = {}

M.on_attach = function(client, buffer, arg)
    arg = arg or {}

    local function buf_set_keymap(lhs, rhs)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(buffer, "n", lhs, rhs, opts)
    end

    local base = function()
        buf_set_keymap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
        buf_set_keymap("<leader>e", "<cmd>lua vim.diagnostic.open_float()<cr>")
        buf_set_keymap("<leader>n", "<cmd>lua vim.lsp.buf.formatting()<cr>")
        buf_set_keymap("<leader>q", "<cmd>lua vim.diagnostic.setloclist()<cr>")
        buf_set_keymap("[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
        buf_set_keymap("]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

        if client.resolved_capabilities.document_highlight then
            vim.cmd([[
                augroup LSP
                    autocmd!
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]])
        end

        if not arg.formatting then
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end

        if arg.hook then
            arg.hook(client, buffer)
        end
    end

    local full = function()
        base()

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
    end

    return {
        base = base,
        full = full,
    }
end

local coq = require("coq")
local lsp = require("lspconfig")

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
    return coq.lsp_ensure_capabilities(vim.tbl_extend("keep", arg, defaults))
end

local function init_server(arg)
    local lsp_setup = vim.tbl_extend("keep", M.lsp_setup(arg), arg)
    lsp[arg.name].setup(lsp_setup)
end

local extend = require("init_functions").extend

local sumneko_lua = {
    name = "sumneko_lua",
    cmd = {
        "lua-language-server",
        table.concat({
            "--logpath=",
            vim.fn.stdpath("cache"),
            "/sumneko",
        }),
    },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = extend(vim.split(package.path, ";"), {
                    "lua/?.lua",
                    "lua/?/init.lua",
                }),
            },
            diagnostics = {
                disable = { "lowercase-global" },
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

local servers = {
    { name = "hls" },
    { name = "pyright" },
    sumneko_lua,
}

for _, server in ipairs(servers) do
    init_server(server)
end

return M
