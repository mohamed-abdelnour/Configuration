nnoremap <silent> <leader>lc :VimtexClean<CR>
nnoremap <silent> <leader>lC :VimtexClean!<CR>
nnoremap <silent> <leader>ll :VimtexCompileSS<CR>
nnoremap <silent> <leader>lr :execute "!pkill -HUP mupdf"<CR>
let g:tex_flavor = "latex"
let g:tex_indent_brace = 0
let g:tex_indent_items = 0
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'hooks' : [],
            \ 'options' : [
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=0',
            \   '-interaction=nonstopmode',
            \ ],
            \ }
let g:vimtex_mappings_enabled = 0
let g:vimtex_matchparen_enabled = 0
