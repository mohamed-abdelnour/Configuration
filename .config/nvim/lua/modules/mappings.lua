local M = {}

local main = function()
    -- Leader keys
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    local set_keymap = vim.keymap.set
    local opts = { silent = true }

    local functions = package.loaded["modules/functions"]

    -- COQ marks
    set_keymap({ "i", "n", "v" }, "<c-j>", functions.buffer.del_coq_marks, opts)

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

    -- nohlsearch
    set_keymap("n", "<c-l>", "<cmd>nohlsearch<cr>", opts)

    -- Toggles
    set_keymap("n", "<leader>t ", functions.toggles.spaceless, opts)
    set_keymap("n", "<leader>tcc", functions.toggles.colour_column, opts)

    local toggle = function(option)
        return function()
            functions.toggles.toggle(option)
        end
    end

    set_keymap("n", "<leader>tcl", toggle("cursorline"), opts)
    set_keymap("n", "<leader>tet", toggle("expandtab"), opts)
    set_keymap("n", "<leader>tic", toggle("ignorecase"), opts)
    set_keymap("n", "<leader>tlb", toggle("linebreak"), opts)
    set_keymap("n", "<leader>tlt", toggle("list"), opts)
    set_keymap("n", "<leader>ts", toggle("spell"), opts)
end

main()

return M
