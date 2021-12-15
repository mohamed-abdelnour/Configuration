local null_ls = require("null-ls")
local helpers = require("null-ls/helpers")
local methods = require("null-ls/methods")

local function make_tool(overrides)
    local function tool(arg)
        local defaults = {
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

    -- gitsigns.nvim
    actions.gitsigns,
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

null_ls.setup({
    diagnostics_format = "[#{c}] #{m} (#{s})",
    on_attach = function(...)
        require("plugins/init_lsp").on_attach(...).base()
    end,
    sources = merge({ act, format, lint }),
})
