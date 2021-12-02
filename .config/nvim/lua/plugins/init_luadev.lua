local set_keymap = vim.api.nvim_set_keymap
local opts = { silent = true }

set_keymap("n", "<leader>rr", "<plug>(Luadev-Run)<cr>", opts)
set_keymap("n", "<leader>rl", "<plug>(Luadev-RunLine)<cr>", opts)
set_keymap("n", "<leader>rw", "<plug>(Luadev-RunWord)<cr>", opts)