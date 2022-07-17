local M = {
    {
        "jose-elias-alvarez/null-ls.nvim",
        opt = false,
        requires = "plenary.nvim",

        config = function()
            Error:guard(function()
                local null_ls = require("null-ls")
                local helpers = require("null-ls.helpers")
                local methods = require("null-ls.methods")

                local check_exit_code = function(name, code)
                    if code ~= 0 then
                        local format = [["%s" failed with exit code: %s]]
                        local message = string.format(format, name, code)
                        vim.schedule(Defer(vim.notify)(message, vim.log.levels.ERROR))
                    end
                    return code
                end

                local make_tool = function(default)
                    return function(arg)
                        arg = vim.tbl_deep_extend("keep", arg, default)
                        arg.generator_opts.check_exit_code = function(code)
                            return check_exit_code(arg.name, code)
                        end
                        return helpers.make_builtin(arg)
                    end
                end

                local make_formatter = make_tool({
                    method = methods.internal.FORMATTING,
                    factory = helpers.formatter_factory,
                    generator_opts = {
                        cwd = function()
                            return vim.fn.expand("%:p:h")
                        end,
                        to_stdin = true,
                    },
                })

                local builtins = null_ls.builtins
                local actions = builtins.code_actions
                local linters = builtins.diagnostics

                local sources = Table.from({
                    -- Shellcheck
                    actions.shellcheck,

                    -- eslint_d
                    actions.eslint_d,

                    -- gitsigns.nvim
                    actions.gitsigns,
                })

                sources:extend(Table.from({
                    make_formatter({
                        name = "Alejandra",
                        filetypes = { "nix" },
                        generator_opts = {
                            command = "alejandra",
                        },
                    }),

                    make_formatter({
                        name = "Black",
                        filetypes = { "python" },
                        generator_opts = {
                            command = "black",
                            args = { "-q", "-" },
                        },
                    }),

                    make_formatter({
                        name = "ClangFormat",
                        filetypes = { "c", "cpp", "cs" },
                        generator_opts = {
                            command = "clang-format",
                            args = { "--assume-filename", "$FILENAME" },
                        },
                    }),

                    make_formatter({
                        name = "Prettier",
                        filetypes = {
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
                        generator_opts = {
                            command = "prettier",
                            args = { "--stdin-filepath", "$FILENAME" },
                        },
                    }),

                    make_formatter({
                        name = "Rustfmt",
                        filetypes = { "rust" },
                        generator_opts = {
                            command = "rustfmt",
                            args = { "--edition=2021" },
                        },
                    }),

                    make_formatter({
                        name = "StyLua",
                        filetypes = { "lua" },
                        generator_opts = {
                            command = "stylua",
                            args = { "-s", "-" },
                        },
                    }),

                    make_formatter({
                        name = "brittany",
                        filetypes = { "haskell" },
                        generator_opts = {
                            command = "brittany",
                        },
                    }),

                    make_formatter({
                        name = "google-java-format",
                        filetypes = { "java" },
                        generator_opts = {
                            command = "google-java-format",
                            args = { "-" },
                        },
                    }),

                    make_formatter({
                        name = "latexindent",
                        filetypes = { "tex" },
                        generator_opts = {
                            command = "latexindent",
                            args = { "-g", "/dev/null" },
                        },
                    }),

                    make_formatter({
                        name = "shfmt",
                        filetypes = { "sh" },
                        generator_opts = {
                            command = "shfmt",
                            args = { "-i", "4", "-ci" },
                        },
                    }),
                }):iter())

                local builtin_linter = function(linter, arg)
                    arg = arg or {}
                    arg.method = arg.method or null_ls.methods.DIAGNOSTICS_ON_SAVE
                    return linters[linter].with(arg)
                end

                sources:extend(Table.from({
                    -- Pylint
                    builtin_linter("pylint", {
                        args = { "-j0", "-f", "json", "$FILENAME" },
                        timeout = 10000,
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
                }):iter())

                null_ls.setup({
                    diagnostics_format = "[#{c}] #{m} (#{s})",
                    on_attach = function(client, buffer)
                        require("modules.lsp").on_attach(client, buffer).base()
                    end,
                    sources = sources,
                })
            end)
        end,
    },
}

return M
