nnoremap <silent> <leader>n :Neoformat<CR>
let g:shfmt_opt="-ci -sr"
let g:neoformat_rust_rustfmt = {
        \ 'exe': 'rustfmt',
        \ 'stdin': 1,
        \ }
