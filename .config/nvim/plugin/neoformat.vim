nnoremap <silent> <leader>n :Neoformat<CR>

let g:neoformat_enabled_java = ['google']
let g:neoformat_java_google = {
            \ 'exe': 'google-java-format',
            \ 'args': ['-'],
            \ 'stdin': 1,
            \ }

let g:neoformat_rust_rustfmt = {
            \ 'exe': 'rustfmt',
            \ 'stdin': 1,
            \ }

" TODO: Remove when `latexindent` is bumped to V3.9.3
let g:neoformat_tex_latexindent = {
            \ 'exe': 'latexindent',
            \ 'args': ['-c', '~/.cache/latexindent'],
            \ 'stdin': 1,
            \ }

let g:shfmt_opt="-ci -sr"
