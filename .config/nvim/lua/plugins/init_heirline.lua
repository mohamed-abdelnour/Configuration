local M = {
    heirline = {
        "rebelot/heirline.nvim",
        after = "modus_vivendi",
        opt = false,
    },
}

M.heirline.config = function()
    local conditions = require("heirline.conditions")
    local utils = require("heirline.utils")

    local palette = package.loaded["modus_vivendi/palette"]
    local functions = package.loaded["modules/init_functions"]
    local icon = package.loaded["modules/init_icons"].U_25CF .. " "

    local align = { provider = "%=" }
    local space = { provider = " " }

    local wrap = functions.wrap

    local normalise_count = function(arg)
        arg.c = arg.c or 0
        if arg.c ~= 0 then
            return table.concat({ arg.l or "", arg.s, arg.c, arg.r or "" })
        end
        return ""
    end

    local intersperse_space = function(t)
        return functions.intersperse(t, space)
    end

    local generate_section = function(arg)
        local result = {}
        for _, v in ipairs(arg.map) do
            table.insert(result, {
                hl = { fg = v.fg },
                provider = function(self)
                    return arg.f(self, v)
                end,
            })
        end
        return result
    end

    local control_map = { [""] = "^V", [""] = "^S" }
    local mode = {
        provider = function()
            return wrap({ s = vim.fn.mode(1):gsub("%c", control_map) })
        end,
    }

    local file_modifiers = function(arg)
        return {
            condition = arg.predicate,
            hl = { fg = arg.fg },
            provider = icon,
        }
    end
    local file = {
        file_modifiers({
            fg = palette.blue_intense,
            predicate = function()
                return vim.bo.modified
            end,
        }),
        file_modifiers({
            fg = palette.red_intense,
            predicate = function()
                return not vim.bo.modifiable or vim.bo.readonly
            end,
        }),
        {
            provider = function()
                local buffer = vim.api.nvim_buf_get_name(0)
                local file_name = vim.fn.fnamemodify(buffer, ":~:.")
                if not conditions.width_percent_below(#file_name, 0.25) then
                    return vim.fn.pathshorten(file_name)
                end
                return file_name
            end,
        },
        { provider = "%<" },
    }

    local git_signs = function()
        local arg = {}
        arg.map = {
            { type = "added", sign = "+", fg = palette.green_alt_other },
            { type = "changed", sign = "~", fg = palette.yellow_alt_other },
            { type = "removed", sign = "-", fg = palette.red_alt_other },
        }
        arg.f = function(self, v)
            return normalise_count({ c = self.status[v.type], s = v.sign, r = " " })
        end
        return generate_section(arg)
    end
    local git = {
        condition = conditions.is_git_repo,
        init = function(self)
            self.status = vim.b.gitsigns_status_dict
        end,
        intersperse_space({
            {
                hl = { fg = palette.cyan },
                provider = function(self)
                    return wrap({ s = self.status.head })
                end,
            },
            { git_signs() },
        }),
    }

    local get_diagnostics = function(severity)
        return #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity] })
    end
    local count_diagnostics = function(severity)
        return normalise_count({ c = get_diagnostics(severity), s = icon, l = " " })
    end
    local diagnostic_sections = function()
        local arg = {}
        arg.map = {
            { type = "ERROR", fg = palette.red_intense },
            { type = "HINT", fg = palette.blue_intense },
            { type = "INFO", fg = palette.purple_intense },
            { type = "WARN", fg = palette.yellow_intense },
        }
        arg.f = function(_, v)
            return count_diagnostics(v.type)
        end
        return generate_section(arg)
    end
    local diagnostics = {
        condition = conditions.has_diagnostics,
        diagnostic_sections(),
    }

    local position = { provider = "(%l/%L, %v) [%p%%]" }

    local active_statusline = intersperse_space({
        mode,
        file,
        git,
        align,
        diagnostics,
        position,
    })

    local inactive_statusline = {
        condition = function()
            return not conditions.is_active()
        end,
        file,
        align,
    }

    local statusline = {
        init = utils.pick_child_on_condition,
        hl = function()
            local style = {
                bg = palette.bg_dim,
                fg = palette.fg_inactive,
            }
            if conditions.is_active() then
                style.fg = palette.fg_active
            end
            return style
        end,
        inactive_statusline,
        active_statusline,
    }

    require("heirline").setup(statusline)
end

return M
