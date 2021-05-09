let g:nnn#set_default_mappings = 0
nnoremap <silent> <C-n> :NnnPicker<CR>

let g:nnn#action = {
            \ '<c-t>': 'tab split',
            \ '<c-x>': 'split',
            \ '<c-v>': 'vsplit'
            \ }
