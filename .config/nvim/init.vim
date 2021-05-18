let mapleader = ' '
let maplocalleader = ' '

" Options (:options)
"  2 moving around, searching and patterns
set ignorecase
set smartcase

"  4 displaying text
set showbreak=-->\ 
set cmdheight=2
set listchars=tab:<->,trail:-,nbsp:+
set relativenumber

"  5 syntax, highlighting and spelling
set nohlsearch
set termguicolors
set spelllang=en_gb

"  6 multiple windows
set statusline=[%{mode()}]\ %<%F\ %h%m%r\ %=\ %l/%L:%c\ [%p%%]
set hidden
set splitright

"  9 using the mouse
set mouse=a

" 11 messages and info
set shortmess+=c
set noshowmode
set noruler

" 12 selecting text
set clipboard=unnamedplus

" 13 editing text
set undofile
set completeopt=menuone,noselect

" 14 tabs and indenting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

" 25 various
set signcolumn=yes

" Plug
call plug#begin(stdpath('data') . '/plugged')
Plug 'LnL7/vim-nix'
Plug 'dstein64/vim-startuptime'
Plug 'hrsh7th/nvim-compe'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'mcchrish/nnn.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'neovimhaskell/haskell-vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'puremourning/vimspector'
Plug 'sbdchd/neoformat'
call plug#end()

lua require('lsp')
lua require('nvim-compe')
lua require('treesitter')
