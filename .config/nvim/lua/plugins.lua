return require('packer').startup(function()
    use 'LnL7/vim-nix'
    use 'dstein64/vim-startuptime'
    use 'hrsh7th/nvim-compe'
    use 'joshdick/onedark.vim'
    use 'lervag/vimtex'
    use 'neovim/nvim-lspconfig'
    use 'neovimhaskell/haskell-vim'
    use 'sbdchd/neoformat'
    use 'wbthomason/packer.nvim'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
end)
