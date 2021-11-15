augroup init
    autocmd!
    autocmd FileType xdefaults hi xdefaultsPunct gui=NONE
    autocmd TermOpen * setlocal nornu
    autocmd TermOpen * startinsert
augroup END
