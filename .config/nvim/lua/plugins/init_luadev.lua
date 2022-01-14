local set_keymap = vim.keymap.set
local opts = { silent = true }

set_keymap("n", "<leader>rr", "<plug>(Luadev-Run)<cr>", opts)
set_keymap("n", "<leader>rl", "<plug>(Luadev-RunLine)<cr>", opts)
set_keymap("n", "<leader>rw", "<plug>(Luadev-RunWord)<cr>", opts)
