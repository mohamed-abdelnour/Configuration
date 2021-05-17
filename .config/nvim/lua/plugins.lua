return require('packer').startup(function()
    use 'LnL7/vim-nix'
    use 'dstein64/vim-startuptime'
    use 'hrsh7th/nvim-compe'
    use 'joshdick/onedark.vim'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'mcchrish/nnn.vim'
    use 'mfussenegger/nvim-dap'
    use 'neovim/nvim-lspconfig'
    use 'neovimhaskell/haskell-vim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sbdchd/neoformat'
    use 'wbthomason/packer.nvim'
    use {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        run = 'cd app && yarn install'
    }
    use {'lervag/vimtex', ft = 'tex'}
end)
