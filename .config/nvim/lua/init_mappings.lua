-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Delete buffer
set_keymap("n", "<leader>d", ":bd<cr>", opts)

-- Move down/up
set_keymap("n", "<A-j>", ":move .+1<cr>", opts)
set_keymap("n", "<A-k>", ":move .-2<cr>", opts)
set_keymap("v", "<A-j>", ":move '>+1<cr>gv", opts)
set_keymap("v", "<A-k>", ":move '<-2<cr>gv", opts)

-- Toggles
-- colorcolumn
set_keymap(
    "n",
    "<leader>cc",
    ':execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<cr>',
    opts
)

-- cursorline
set_keymap("n", "<leader>cl", ":set cursorline!<cr>", opts)

-- expandtab
set_keymap("n", "<leader>et", ":set expandtab!<cr>", opts)

-- linebreak
set_keymap("n", "<leader>lb", ":set linebreak!<cr>", opts)

-- list
set_keymap("n", "<leader>lt", ":set list!<cr>", opts)

-- spell
set_keymap("n", "<leader>s", ":set spell!<cr>", opts)

-- Plugin(s)
-- Telescope
set_keymap("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]], opts)
set_keymap("n", "<leader>fe", [[<cmd>lua require('telescope.builtin').builtin()<cr>]], opts)
set_keymap("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], opts)
set_keymap("n", "<leader>fr", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], opts)
set_keymap("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], opts)
set_keymap("n", "<leader>fn", [[<cmd>lua require('telescope.builtin').file_browser()<cr>]], opts)

-- Trouble
set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opts)
set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", opts)
set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", opts)
set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", opts)
set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)
