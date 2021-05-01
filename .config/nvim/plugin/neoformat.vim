nnoremap <silent> <leader>n :Neoformat<CR>
let g:shfmt_opt="-ci -sr"
let g:neoformat_rust_rustfmt = {
            \ 'exe': 'rustfmt',
            \ 'stdin': 1,
            \ }
let g:neoformat_java_google = {
            \ 'exe': 'google-java-format',
            \ 'args': ['-'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_java = ['google']
