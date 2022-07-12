local api = vim.api

local M = {}

M.toggle = function()
    local spaceless = { group = "spaceless" }
    if next(api.nvim_get_autocmds(spaceless)) == nil then
        require("spaceless").setup()
    else
        api.nvim_clear_autocmds(spaceless)
    end
end

return M
