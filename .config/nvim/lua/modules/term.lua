local M = {}

M.term_open = function()
    vim.cmd("startinsert")
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
end

return M
