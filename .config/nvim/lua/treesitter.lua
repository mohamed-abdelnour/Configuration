require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'c', 'haskell', 'java', 'latex', 'lua', 'nix', 'python', 'rust', 'toml',
        'yaml'
    },
    highlight = {enable = true}
}
