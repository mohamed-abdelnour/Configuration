local M = {}

M.term_open = function()
    vim.cmd("startinsert")
    local opt = vim.opt_local
    opt.relativenumber = false
    opt.signcolumn = "no"
end

return M
