local M = {}

local function init()
    -- Leader keys
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    local set_keymap = vim.keymap.set
    local opts = { silent = true }

    -- Delete buffer
    set_keymap("n", "<leader>k", "<cmd>bd<cr>", opts)

    -- Diff
    set_keymap("n", "<leader>db", "<cmd>diffget BASE<cr>", opts)
    set_keymap("n", "<leader>dl", "<cmd>diffget LOCAL<cr>", opts)
    set_keymap("n", "<leader>dr", "<cmd>diffget REMOTE<cr>", opts)

    -- Move down/up
    set_keymap("n", "<A-j>", "<cmd>move .+1<cr>", opts)
    set_keymap("n", "<A-k>", "<cmd>move .-2<cr>", opts)
    set_keymap("v", "<A-j>", "<cmd>move '>+1<cr>gv", opts)
    set_keymap("v", "<A-k>", "<cmd>move '<-2<cr>gv", opts)

    -- Toggles
    ---- colorcolumn
    set_keymap(
        "n",
        "<leader>tcc",
        [[<cmd>execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>]],
        opts
    )

    ---- cursorline
    set_keymap("n", "<leader>tcl", "<cmd>set cursorline!<cr>", opts)

    ---- expandtab
    set_keymap("n", "<leader>tet", "<cmd>set expandtab!<cr>", opts)

    ---- ignorecase
    set_keymap("n", "<leader>tic", "<cmd>set ignorecase!<cr>", opts)

    ---- linebreak
    set_keymap("n", "<leader>tlb", "<cmd>set linebreak!<cr>", opts)

    ---- list
    set_keymap("n", "<leader>tlt", "<cmd>set list!<cr>", opts)

    ---- spell
    set_keymap("n", "<leader>ts", "<cmd>set spell!<cr>", opts)
end

init()

return M
