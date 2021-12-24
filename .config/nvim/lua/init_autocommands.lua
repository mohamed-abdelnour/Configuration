vim.cmd([[
    augroup term
        autocmd!
        autocmd FileType gitcommit setlocal spell
        autocmd TermOpen * setlocal nornu
        autocmd TermOpen * setlocal signcolumn=no
        autocmd TermOpen * startinsert
    augroup END
]])
