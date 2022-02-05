local M = {
    nvim_web_devicons = {
        "kyazdani42/nvim-web-devicons",
        opt = false,
    },
}

M.nvim_web_devicons.config = function()
    local devicons = require("nvim-web-devicons")
    local module = require("modules/init_icons")
    local icons = devicons.get_icons()
    icons.default_icon = {
        color = "Normal",
        name = "Default",
    }
    icons = module.set_icons({
        result = icons,
        fn = function(result, k, _, icon)
            result[k].icon = icon
        end,
    })
    devicons.setup({
        default = true,
        override = icons,
    })
    module.init()
end

return M
