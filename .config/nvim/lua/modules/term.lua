local M = {}

function M.term_open()
    vim.cmd("startinsert")
    local opt = vim.opt_local
    opt.relativenumber = false
    opt.signcolumn = "no"
end

return M
