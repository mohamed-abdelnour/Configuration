local Table = require("lib.table")

local PATTERN = "^#!/usr/bin/env (.*)$"

local shebangs = {
    bash = "sh",
    dash = "sh",
    python3 = "python",
}

local match_shebang = function(buffer)
    local shebang = Table.from(vim.api.nvim_buf_get_lines(buffer, 0, 1, true))
        :iter()
        :map(function(s)
            return s:match(PATTERN)
        end)
        :next()

    return shebangs[shebang] or shebang
end

vim.filetype.add({
    extension = {
        ejs = "html",
    },
    filename = {
        xinitrc = "sh",
    },
    pattern = {
        [".*"] = function(_, buffer)
            return match_shebang(buffer)
        end,
    },
})
