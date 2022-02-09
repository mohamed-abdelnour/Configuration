local main = function()
    vim.g.man_hardwrap = false
    vim.keymap.del("n", "q", { buffer = 0 })
    vim.opt_local.signcolumn = "no"
end

main()
