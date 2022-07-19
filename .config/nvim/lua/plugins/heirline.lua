local M = {
    {
        "rebelot/heirline.nvim",
        after = "modus_themes.nvim",
        opt = false,

        config = function()
            Error:guard(function()
                local ICON = require("modules.icons").U_25CF .. " "

                local conditions = require("heirline.conditions")

                local palette = require("modus_themes").palette

                local align = { provider = "%=" }
                local space = { provider = " " }
                local truncate = { provider = "%<" }

                local mode = function()
                    local control_map = { ["\19"] = "^S", ["\22"] = "^V" }
                    return {
                        provider = function()
                            return vim.fn.mode(1):gsub("%c", control_map):wrap()
                        end,
                    }
                end

                local file = function()
                    local SUFFIX_LENGTH = 40

                    local shorten = function(s)
                        return s:sub(-SUFFIX_LENGTH):gsub(".-(/.*)", "...%1")
                    end

                    local modifier = function(predicate, foreground)
                        return {
                            condition = predicate,
                            hl = { fg = foreground },
                            provider = ICON,
                        }
                    end

                    local read_only = modifier(function()
                        return not vim.bo.modifiable or vim.bo.readonly
                    end, palette.red_alt_other)

                    local buffer_name = {
                        hl = function()
                            return vim.bo.modified and { fg = palette.cyan }
                        end,
                        provider = function()
                            local buffer = vim.api.nvim_buf_get_name(0)
                            local name = vim.fn.fnamemodify(buffer, ":~:.")
                            return #name > SUFFIX_LENGTH and shorten(name) or name
                        end,
                    }

                    return { read_only, truncate, buffer_name }
                end

                local Signs = {}

                Signs.__index = Signs

                function Signs:__tostring()
                    return table.concat({ self.left, self.sign, self.count, self.right })
                end

                function Signs.new(key, fg, sign)
                    local t = { key = key, fg = fg, sign = sign, count = 0 }
                    return setmetatable(t, Signs)
                end

                function Signs:fmt(left, right, sign)
                    self.left = left
                    self.right = right
                    self.sign = sign or self.sign
                    return self
                end

                function Signs:define()
                    return {
                        hl = { fg = self.fg },
                        provider = function(line)
                            self.count = line.status[self.key] or self.count
                            return self.count ~= 0 and tostring(self)
                        end,
                    }
                end

                local git = function()
                    local head = {
                        hl = { fg = palette.cyan },
                        provider = function(self)
                            return self.status.head:wrap()
                        end,
                    }

                    local signs = Table.from({
                        Signs.new("added", palette.green_alt_other, "+"),
                        Signs.new("changed", palette.yellow_alt_other, "~"),
                        Signs.new("removed", palette.red_alt_other, "-"),
                    })
                        :iter()
                        :map(function(sign)
                            return sign:fmt("", " "):define()
                        end)
                        :collect()

                    return {
                        condition = conditions.is_git_repo,
                        init = function(self)
                            self.status = {}
                            setmetatable(self.status, {
                                __index = vim.b.gitsigns_status_dict,
                            })
                        end,
                        Table.from({ head, signs }):iter():intersperse(space):collect(),
                    }
                end

                local diagnostic = function()
                    local meta = {}
                    meta.__index = function(_, key)
                        local status = vim.diagnostic
                        return #status.get(0, {
                            severity = status.severity[key],
                        })
                    end

                    local signs = Table.from({
                        Signs.new("ERROR", palette.red_alt_other),
                        Signs.new("WARN", palette.yellow_alt_other),
                        Signs.new("INFO", palette.magenta_alt_other),
                        Signs.new("HINT", palette.blue_alt_other),
                    })
                        :iter()
                        :map(function(sign)
                            return sign:fmt(" ", "", ICON):define()
                        end)
                        :collect()

                    return {
                        condition = conditions.has_diagnostics,
                        init = function(self)
                            self.status = {}
                            setmetatable(self.status, meta)
                        end,
                        signs,
                    }
                end

                local position = { provider = "(%l/%L, %v) [%p%%]" }

                local statusline = {
                    hl = function()
                        return { bg = palette.bg_dim, fg = palette.fg_active }
                    end,
                    Table.from({ mode(), file(), git(), align, diagnostic(), position })
                        :iter()
                        :intersperse(space)
                        :collect(),
                }

                require("heirline").setup(statusline)
            end)
        end,
    },
}

return M
