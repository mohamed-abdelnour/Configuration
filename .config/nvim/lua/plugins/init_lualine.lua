local palette = require("lush_theme/palette")
local trim_wrap = require("init_functions").trim_wrap

local right_padding = { left = 0, right = 1 }
local left_padding = { left = 1, right = 0 }

local function pad(tables, padding)
    for _, table in ipairs(tables) do
        table.padding = padding
    end
    return tables
end

local function right_pad(tables)
    return pad(tables, right_padding)
end

local function left_pad(tables)
    return pad(tables, left_padding)
end

local function trim_wrap_rbar(string)
    return trim_wrap(string, "", " |")
end

local function trim_wrap_parens(string)
    return trim_wrap(string, "(", ")")
end

local lualine_sections = {
    lualine_a = right_pad({
        {
            "%{mode()}",
            fmt = trim_wrap,
        },
    }),

    lualine_b = right_pad({
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
            [[require("init_functions").call_or(treesitter_section, "")]],
            fmt = trim_wrap_rbar,
        },
        {
            "diagnostics",
            sources = { "nvim_diagnostic" },
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
        icons_enabled = false,
        section_separators = "",
        theme = require("lush_theme/lualine/modus_vivendi"),
    },
    sections = lualine_sections,
    inactive_sections = vim.tbl_extend("keep", lualine_inactive_sections, lualine_sections),
})
