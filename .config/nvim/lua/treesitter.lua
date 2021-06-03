require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'c', 'comment', 'java', 'lua', 'nix', 'python', 'rust', 'toml', 'yaml'
    },
    highlight = {enable = true}
}
