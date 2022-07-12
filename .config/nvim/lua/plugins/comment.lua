local M = {
    {
        "numToStr/Comment.nvim",
        opt = false,

        config = function()
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
        end,
    },
}

return M
