f = require("init_functions")

local right_padding = { left = 0, right = 1 }
local left_padding = { left = 1, right = 0 }

local lualine_sections = {
    lualine_a = {
        {
            "%{mode()}",
            fmt = f.trim_wrap,
            padding = right_padding,
        },
    },

    lualine_b = {
        {
            "%<%F %h%m%r",
            padding = right_padding,
        },
    },

    lualine_c = {},

    lualine_x = {
        {
            [[f.call_or(treesitter_section, "")]],
            fmt = function(string)
                return f.trim_wrap(string, "", " |")
            end,
            padding = left_padding,
        },
        {
            "diagnostics",
            padding = left_padding,
            sources = { "nvim_lsp" },
        },
    },

    lualine_y = {
        {
            "%l/%L, %c",
            fmt = function(string)
                return f.trim_wrap(string, "(", ")")
            end,
            padding = left_padding,
        },
    },

    lualine_z = {
        {
            "%p%%",
            fmt = f.trim_wrap,
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
