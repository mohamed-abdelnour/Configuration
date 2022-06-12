local M = {
    ivy = function()
        return require("telescope/themes").get_ivy({
            layout_config = {
                height = 20,
            },
        })
    end,
}

return M
