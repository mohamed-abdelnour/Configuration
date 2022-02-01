local M = {
    haskell = {
        "neovimhaskell/haskell-vim",
        ft = "haskell",
    },

    markdown = {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = "cd app && yarn install",
    },

    rust = {
        "simrat39/rust-tools.nvim",
        ft = "rust",
    },

    typescript = {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        ft = {
            "javascript",
            "javascript.jsx",
            "javascriptreact",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
        },
    },
}

M.markdown.config = function()
    opts = { silent = true }
    vim.keymap.set("n", "<leader>m", ":MarkdownPreviewToggle<cr>", opts)
end

M.rust.config = function()
    local lsp_setup = require("modules/init_lsp").lsp_setup()

    lsp_setup.settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    }

    require("rust-tools").setup({
        tools = {
            inlay_hints = {
                parameter_hints_prefix = "← ",
                other_hints_prefix = "⇒ ",
            },
        },
        server = lsp_setup,
    })
end

M.typescript.config = function()
    require("modules/init_lsp").init_server({
        name = "tsserver",
        init_options = require("nvim-lsp-ts-utils").init_options,
        hook = function(client, _)
            local ts_utils = require("nvim-lsp-ts-utils")
            ts_utils.setup({
                auto_inlay_hints = false,
                filter_out_diagnostics_by_code = { 80001 },
            })
            ts_utils.setup_client(client)
        end,
    })
end

return M
