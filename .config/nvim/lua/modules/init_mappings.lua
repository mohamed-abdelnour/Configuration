local M = {}

local function main()
    -- Leader keys
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    local set_keymap = vim.keymap.set
    local opts = { silent = true }

    -- Delete buffer
    set_keymap("n", "<leader>k", ":bd<cr>", opts)

    -- Diff
    set_keymap("n", "<leader>db", ":diffget BASE<cr>", opts)
    set_keymap("n", "<leader>dl", ":diffget LOCAL<cr>", opts)
    set_keymap("n", "<leader>dr", ":diffget REMOTE<cr>", opts)

    -- Move down/up
    set_keymap("n", "<A-j>", ":move .+1<cr>", opts)
    set_keymap("n", "<A-k>", ":move .-2<cr>", opts)
    set_keymap("v", "<A-j>", ":move '>+1<cr>gv", opts)
    set_keymap("v", "<A-k>", ":move '<-2<cr>gv", opts)

    -- Toggles
    ---- colorcolumn
    set_keymap(
        "n",
        "<leader>tcc",
        [[:execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>]],
        opts
    )

    ---- cursorline
    set_keymap("n", "<leader>tcl", ":set cursorline!<cr>", opts)

    ---- expandtab
    set_keymap("n", "<leader>tet", ":set expandtab!<cr>", opts)

    ---- ignorecase
    set_keymap("n", "<leader>tic", ":set ignorecase!<cr>", opts)

    ---- linebreak
    set_keymap("n", "<leader>tlb", ":set linebreak!<cr>", opts)

    ---- list
    set_keymap("n", "<leader>tlt", ":set list!<cr>", opts)

    ---- spell
    set_keymap("n", "<leader>ts", ":set spell!<cr>", opts)
end

main()

return M
