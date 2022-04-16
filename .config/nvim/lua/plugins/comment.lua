local M = {
    comment = {
        "numToStr/Comment.nvim",
        opt = false,
    },
}

M.comment.config = function()
    require("Comment").setup({
        toggler = {
            line = ";;",
            block = ";b",
        },
        opleader = {
            line = "g;",
            block = "gb",
        },
    })
end

return M
