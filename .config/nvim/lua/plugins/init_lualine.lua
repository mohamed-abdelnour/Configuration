local palette = require("lush_theme/palette")
local trim_wrap = require("init_functions").trim_wrap

local right_padding = { left = 0, right = 1 }
local left_padding = { left = 1, right = 0 }

local lualine_sections = {
    lualine_a = {
        {
            "%{mode()}",
            fmt = trim_wrap,
            padding = right_padding,
        },
    },

    lualine_b = {
        {
            "filename",
            padding = right_padding,
            path = 1,
            symbols = {
                modified = " [+]",
                readonly = " [RO]",
            },
        },
    },

    lualine_c = {
        {
            "branch",
            color = { fg = palette.cyan },
            padding = right_padding,
        },
        {
            "diff",
            diff_color = {
                added = { fg = palette.green },
                modified = { fg = palette.yellow },
                removed = { fg = palette.red },
            },
            padding = right_padding,
        },
    },

    lualine_x = {
        {
            [[require("init_functions").call_or(treesitter_section, "")]],
            fmt = function(string)
                return trim_wrap(string, "", " |")
            end,
            padding = left_padding,
        },
        {
            "diagnostics",
            padding = left_padding,
            sources = { "nvim_diagnostic" },
        },
    },

    lualine_y = {
        {
            "%l/%L, %v",
            fmt = function(string)
                return trim_wrap(string, "(", ")")
            end,
            padding = left_padding,
        },
    },

    lualine_z = {
        {
            "%p%%",
            fmt = trim_wrap,
            padding = left_padding,
        },
    },
}

require("lualine").setup({
    options = {
        component_separators = "",
        icons_enabled = false,
        section_separators = "",
        theme = require("lush_theme/lualine/modus_vivendi"),
    },
    sections = lualine_sections,
    inactive_sections = {
        lualine_a = {},
        lualine_b = lualine_sections.lualine_b,
        lualine_c = {},
        lualine_x = {},
        lualine_y = lualine_sections.lualine_y,
        lualine_z = lualine_sections.lualine_z,
    },
})
