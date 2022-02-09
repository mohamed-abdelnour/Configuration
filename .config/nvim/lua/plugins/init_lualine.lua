local M = {
    lualine = {
        "nvim-lualine/lualine.nvim",
        opt = false,
    },
}

M.lualine.config = function()
    local palette = require("lush_theme/palette")
    local trim_wrap = package.loaded["modules/init_functions"].trim_wrap

    local right_padding = { left = 0, right = 1 }
    local left_padding = { left = 1, right = 0 }

    local pad = function(tables, padding)
        for _, table in ipairs(tables) do
            table.padding = padding
        end
        return tables
    end

    local right_pad = function(tables)
        return pad(tables, right_padding)
    end

    local left_pad = function(tables)
        return pad(tables, left_padding)
    end

    local trim_wrap_rbar = function(string)
        return trim_wrap(string, "", " |")
    end

    local trim_wrap_parens = function(string)
        return trim_wrap(string, "(", ")")
    end

    local diagnostic_icons = (function()
        local keys = { "error", "warn", "info", "hint" }
        local icons = {}
        for _, k in ipairs(keys) do
            icons[k] = package.loaded["modules/init_icons"].U_25CF .. " "
        end
        return icons
    end)()

    local lualine_sections = {
        lualine_a = right_pad({
            {
                "%{mode()}",
                fmt = trim_wrap,
            },
        }),

        lualine_b = right_pad({
            {
                "filetype",
                icon_only = true,
            },
            {
                "filename",
                path = 1,
                symbols = {
                    modified = " [+]",
                    readonly = " [RO]",
                },
            },
        }),

        lualine_c = right_pad({
            {
                "branch",
                color = { fg = palette.cyan },
            },
            {
                "diff",
                diff_color = {
                    added = { fg = palette.green },
                    modified = { fg = palette.yellow },
                    removed = { fg = palette.red },
                },
            },
        }),

        lualine_x = left_pad({
            {
                [[require("lsp-status/statusline").progress()]],
                fmt = trim_wrap_rbar,
            },
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = diagnostic_icons,
            },
        }),

        lualine_y = left_pad({
            {
                "%l/%L, %v",
                fmt = trim_wrap_parens,
            },
        }),

        lualine_z = left_pad({
            {
                "%p%%",
                fmt = trim_wrap,
            },
        }),
    }

    local lualine_inactive_sections = {
        lualine_a = {},
        lualine_c = {},
        lualine_x = {},
    }

    require("lualine").setup({
        options = {
            component_separators = "",
            section_separators = "",
            theme = require("lush_theme/lualine/modus_vivendi"),
        },
        sections = lualine_sections,
        inactive_sections = vim.tbl_extend("keep", lualine_inactive_sections, lualine_sections),
    })
end

return M
