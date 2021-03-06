local M = {}

local main = function()
    local opt = vim.opt

    --  2 moving around, searching and patterns
    opt.ignorecase = true
    opt.smartcase = true

    --  4 displaying text
    opt.showbreak = require("modules.icons").U_21AA .. " "
    opt.cmdheight = 2
    opt.listchars = { nbsp = " ", tab = "<->", trail = "-" }
    opt.relativenumber = true

    --  5 syntax, highlighting and spelling
    opt.termguicolors = true
    opt.spelllang = "en_gb"

    --  6 multiple windows
    opt.laststatus = 3
    opt.splitbelow = true
    opt.splitright = true

    --  9 using the mouse
    opt.mouse = "a"

    -- 11 messages and info
    opt.shortmess:append("c")
    opt.showmode = false
    opt.ruler = false

    -- 12 selecting text
    opt.clipboard = "unnamedplus"

    -- 13 editing text
    opt.undofile = true

    -- 14 tabs and indenting
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smartindent = true

    -- 25 various
    opt.signcolumn = "yes"
end

main()

return M
