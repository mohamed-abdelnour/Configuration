-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- Delete buffer
vim.api.nvim_set_keymap("n", "<leader>d", ":bd!<cr>", opts)

-- Toggles
-- colorcolumn
vim.api.nvim_set_keymap(
    "n",
    "<leader>cc",
    ':execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>',
    opts
)

-- cursorline
vim.api.nvim_set_keymap("n", "<leader>cl", ":set cursorline!<cr>", opts)

-- expandtab
vim.api.nvim_set_keymap("n", "<leader>et", ":set expandtab!<cr>", opts)

-- hlsearch
vim.api.nvim_set_keymap("n", "<leader>h", ":set hlsearch!<cr>", opts)

-- linebreak
vim.api.nvim_set_keymap("n", "<leader>lb", ":set linebreak!<cr>", opts)

-- list
vim.api.nvim_set_keymap("n", "<leader>lt", ":set list!<cr>", opts)

-- spell
vim.api.nvim_set_keymap("n", "<leader>s", ":set spell!<cr>", opts)

-- Plugin(s)
-- Neoformat
vim.api.nvim_set_keymap("n", "<leader>n", ":Neoformat<cr>", opts)

-- Telescope
vim.api.nvim_set_keymap(
    "n",
    "<leader>fb",
    [[<cmd>lua require('telescope.builtin').buffers()<cr>]],
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fe",
    [[<cmd>lua require('telescope.builtin').builtin()<cr>]],
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>ff",
    [[<cmd>lua require('telescope.builtin').find_files()<cr>]],
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fg",
    [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fh",
    [[<cmd>lua require('telescope.builtin').help_tags()<cr>]],
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fn",
    [[<cmd>lua require('telescope.builtin').file_browser()<cr>]],
    opts
)
