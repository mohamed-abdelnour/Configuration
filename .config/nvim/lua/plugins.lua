return require('packer').startup(function()
    use 'LnL7/vim-nix'
    use 'joshdick/onedark.vim'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'neovim/nvim-lspconfig'
    use 'neovimhaskell/haskell-vim'
    use 'nvim-lua/completion-nvim'
    use 'sbdchd/neoformat'
    use 'wbthomason/packer.nvim'
    use {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        run = 'cd app && yarn install'
    }
    use {'lervag/vimtex', ft = 'tex'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
end)
