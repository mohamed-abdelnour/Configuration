local M = {
    null_ls = {
        "jose-elias-alvarez/null-ls.nvim",
        opt = false,
        requires = "plenary.nvim",
    },
}

M.null_ls.config = function()
    local null_ls = require("null-ls")
    local helpers = require("null-ls/helpers")
    local methods = require("null-ls/methods")

    local make_tool = function(overrides)
        local tool = function(arg)
            local defaults = {
                name = arg.name,
                filetypes = arg.ft,
                generator_opts = vim.tbl_extend("keep", arg, overrides.opts),
            }
            return helpers.make_builtin(vim.tbl_extend("keep", overrides, defaults))
        end

        return tool
    end

    local make_formatter = make_tool({
        method = methods.internal.FORMATTING,
        factory = helpers.formatter_factory,
        opts = {
            cwd = function()
                return vim.fn.expand("%:p:h")
            end,
            to_stdin = true,
        },
    })

    -- selene: allow(unused_variable)
    local make_linter = make_tool({
        method = methods.internal.DIAGNOSTICS_ON_SAVE,
        factory = helpers.generator_factory,
        opts = {
            to_stdin = true,
        },
    })

    local builtins = null_ls.builtins
    local actions = builtins.code_actions
    local linters = builtins.diagnostics

    local act = {
        -- Shellcheck
        actions.shellcheck,

        -- eslint_d
        actions.eslint_d,

        -- gitsigns.nvim
        actions.gitsigns,
    }

    local format = {
        make_formatter({
            name = "Alejandra",
            command = "alejandra",
            ft = { "nix" },
        }),

        make_formatter({
            name = "Black",
            command = "black",
            args = { "-q", "-" },
            ft = { "python" },
        }),

        make_formatter({
            name = "ClangFormat",
            command = "clang-format",
            args = { "--assume-filename", "$FILENAME" },
            ft = { "c", "cpp", "cs" },
        }),

        make_formatter({
            name = "Prettier",
            command = "prettier",
            args = { "--stdin-filepath", "$FILENAME" },
            ft = {
                "css",
                "graphql",
                "html",
                "javascript",
                "javascriptreact",
                "json",
                "less",
                "markdown",
                "scss",
                "typescript",
                "typescriptreact",
                "vue",
                "yaml",
            },
        }),

        make_formatter({
            name = "Rustfmt",
            command = "rustfmt",
            ft = { "rust" },
        }),

        make_formatter({
            name = "StyLua",
            command = "stylua",
            args = { "-s", "-" },
            ft = { "lua" },
        }),

        make_formatter({
            name = "brittany",
            command = "brittany",
            ft = { "haskell" },
        }),

        make_formatter({
            name = "latexindent",
            command = "latexindent",
            args = { "-g", "/dev/null" },
            ft = { "tex" },
        }),

        make_formatter({
            name = "shfmt",
            command = "shfmt",
            args = { "-i", "4", "-ci" },
            ft = { "sh" },
        }),
    }

    local builtin_linter = function(linter, arg)
        local defaults = {
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }
        return linters[linter].with(vim.tbl_extend("keep", arg or {}, defaults))
    end

    local lint = {
        -- Pylint
        builtin_linter("pylint", {
            args = { "-j0", "-f", "json", "$FILENAME" },
        }),

        -- Shellcheck
        builtin_linter("shellcheck"),

        -- deadnix
        builtin_linter("deadnix"),

        -- eslint_d
        builtin_linter("eslint_d", {
            args = { "-f", "json", "$FILENAME" },
        }),

        -- selene
        builtin_linter("selene"),

        -- statix
        builtin_linter("statix"),
    }

    local merge = package.loaded["modules/functions"].tbl.merge

    null_ls.setup({
        diagnostics_format = "[#{c}] #{m} (#{s})",
        on_attach = function(client, buffer)
            package.loaded["modules/lsp"].on_attach(client, buffer, {
                formatting = true,
            }).base()
        end,
        sources = merge({ act, format, lint }),
    })
end

return M
