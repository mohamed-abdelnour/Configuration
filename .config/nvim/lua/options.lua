local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

--  2 moving around, searching and patterns
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)

--  4 displaying text
opt('o', 'showbreak', '--> ')
opt('o', 'cmdheight', 2)
opt('w', 'relativenumber', true)

--  5 syntax, highlighting and spelling
opt('o', 'hlsearch', false)
opt('o', 'termguicolors', true)
opt('b', 'spelllang', 'en_gb')

--  6 multiple windows
opt('o', 'statusline', '[%{mode()}] %<%F %h%m%r %= %l/%L:%c [%p%%]')
opt('o', 'hidden', true)
opt('o', 'splitright', true)

--  9 using the mouse
opt('o', 'mouse', 'a')

-- 11 messages and info
vim.cmd('set shortmess+=c')
opt('o', 'showmode', false)
opt('o', 'ruler', false)

-- 12 selecting text
opt('o', 'clipboard', 'unnamedplus')

-- 13 editing text
opt('b', 'undofile', true)
opt('o', 'completeopt', 'menuone,noinsert,noselect')

-- 14 tabs and indenting
opt('b', 'tabstop', 4)
opt('b', 'shiftwidth', 4)
opt('b', 'softtabstop', 4)
opt('b', 'expandtab', true)
opt('b', 'smartindent', true)

-- 25 various
opt('w', 'signcolumn', 'yes')
