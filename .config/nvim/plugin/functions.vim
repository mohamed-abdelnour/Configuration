" BulkCommand
nnoremap <silent> <leader>bc :call BulkCommand()<CR>
function! BulkCommand()
    execute "%s/.*/'&'"
endfunction

" BulkRename
nnoremap <silent> <leader>br :call BulkRename()<CR>
function! BulkRename()
    execute "%s/.*/mv '&' '&'"
endfunction

" CheckDash
function! CheckDash()
    if getline(1) =~ '^#!.*dash$'
        setlocal filetype=sh
    endif
endfunction

" ColourTest
function! ColourTest()
    execute "so $VIMRUNTIME/syntax/hitest.vim"
endfunction

" DeleteBuffer
nnoremap <silent> <leader>d :execute "bd!"<CR>

" Startup Scripts
" :scriptnames

" Toggles
" hlsearch
nnoremap <silent> <leader>h :set hlsearch!<CR> 
function! ToggleHLS()
    if v:hlsearch == 0
        execute "set hls"
    else
        execute "set nohls"
    endif
endfunction

" colorcolumn
nnoremap <silent> <leader>cc :execute "set colorcolumn=" 
            \ . (&colorcolumn == "" ? "80" : "")<CR>

" cursorline
nnoremap <silent> <leader>cl :set cursorline!<CR>

" linebreak
nnoremap <silent> <leader>lb :set linebreak!<CR>

" list
nnoremap <silent> <leader>lt :set list!<CR>

" spell
nnoremap <silent> <leader>s :set spell!<CR>
