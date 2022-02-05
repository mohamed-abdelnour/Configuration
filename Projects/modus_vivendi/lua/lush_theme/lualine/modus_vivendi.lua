local p = require("lush_theme/palette")

local function make_section(bg, fg)
    return { bg = bg, fg = fg }
end

local function make_mode(bg, fg)
    local section = make_section(bg, fg)
    local modes = { "a", "b", "c", "x", "y", "z" }
    local result = {}
    for _, mode in ipairs(modes) do
        result[mode] = section
    end
    return result
end

local function make_modes()
    local active_section = make_mode(p.bg_dim, p.fg_active)
    local active_modes = { "normal", "insert", "visual", "replace", "command" }
    local result = {}
    for _, active_mode in ipairs(active_modes) do
        result[active_mode] = active_section
    end
    result.inactive = make_mode(p.bg_dim, p.fg_inactive)
    return result
end

return make_modes()
