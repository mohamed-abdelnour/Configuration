local M = {}

M.treesitter_section = function()
    return require("nvim-treesitter").statusline(40)
end

return M
