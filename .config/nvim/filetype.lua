local match_shebang = function(buffer)
    local regex = "^#!/usr/bin/env (.*)$"
    local shebang = vim.api.nvim_buf_get_lines(buffer, 0, 1, true)[1]:match(regex)
    local shebangs = {
        bash = "sh",
        dash = "sh",
        python3 = "python",
    }
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
