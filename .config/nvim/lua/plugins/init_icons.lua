local M = {
    nvim_web_devicons = {
        "kyazdani42/nvim-web-devicons",
        opt = false,
    },
}

M.nvim_web_devicons.config = function()
    local devicons = require("nvim-web-devicons")
    local init_icons = package.loaded["modules/init_icons"]
    local icons = devicons.get_icons()
    icons.default_icon = {
        color = "Normal",
        name = "Default",
    }
    local override
    for k, _ in pairs(icons) do
        override = init_icons.overrides[k]
        if override then
            icons[k] = override
        else
            icons[k].icon = init_icons.U_25CF
        end
    end
    devicons.setup({
        default = true,
        override = icons,
    })
    init_icons.main()
end

return M
