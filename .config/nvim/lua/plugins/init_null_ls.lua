local null_ls = require("null-ls")
local helpers = require("null-ls/helpers")
local methods = require("null-ls/methods")

local function make_formatter(arg)
    local opts = {
        cwd = function()
            return vim.fn.expand("%:p:h")
        end,
        to_stdin = true,
    }
    return helpers.make_builtin({
        method = methods.internal.FORMATTING,
        filetypes = arg.ft,
        generator_opts = vim.tbl_extend("keep", arg, opts),
        factory = helpers.formatter_factory,
    })
end

local builtins = null_ls.builtins
local actions = builtins.code_actions
local linters = builtins.diagnostics

local act = {
    -- Shellcheck
    actions.shellcheck,
}

local format = {
    -- Black
    make_formatter({
        command = "black",
        args = { "-q", "-" },
        ft = { "python" },
    }),

    -- ClangFormat
    make_formatter({
        command = "clang-format",
        args = { "--assume-filename", "$FILENAME" },
        ft = { "c", "cpp", "cs" },
    }),

    -- Prettier
    make_formatter({
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

    -- Rustfmt
    make_formatter({
        command = "rustfmt",
        ft = { "rust" },
    }),

    -- StyLua
    make_formatter({
        command = "stylua",
        args = { "-s", "-" },
        ft = { "lua" },
    }),

    -- brittany
    make_formatter({
        command = "brittany",
        ft = { "haskell" },
    }),

    -- latexindent
    make_formatter({
        command = "latexindent",
        -- TODO: Remove when `latexindent` is bumped to V3.9.3
        args = { "-c", vim.fn.expand("~/.cache/latexindent") },
        ft = { "tex" },
    }),

    -- nixpkgs-fmt
    make_formatter({
        command = "nixpkgs-fmt",
        ft = { "nix" },
    }),

    -- shfmt
    make_formatter({
        command = "shfmt",
        args = { "-i", "4", "-ci" },
        ft = { "sh" },
    }),
}

local lint = {
    -- Pylint
    linters.pylint.with({
        args = { "-j0", "-f", "json", "$FILENAME" },
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }),

    -- Shellcheck
    linters.shellcheck,
}

local merge = require("init_functions").merge

null_ls.config({
    diagnostics_format = "[#{c}] #{m} (#{s})",
    sources = merge({ act, format, lint }),
})
