local M = {}

local main = function()
    -- Leader keys
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    local functions = require("modules.functions")
    local set_keymap = vim.keymap.set

    -- Delete buffer
    set_keymap("n", "<leader>k", "<cmd>bd<cr>")

    -- Diff
    set_keymap("n", "<leader>db", "<cmd>diffget BASE<cr>")
    set_keymap("n", "<leader>dl", "<cmd>diffget LOCAL<cr>")
    set_keymap("n", "<leader>dr", "<cmd>diffget REMOTE<cr>")

    -- nohlsearch
    set_keymap("n", "<c-l>", "<cmd>nohlsearch<cr>")

    -- Toggles
    set_keymap("n", "<leader>t ", functions.toggles.spaceless)
    set_keymap("n", "<leader>tcc", functions.toggles.colour_column)

    local toggle = function(option)
        return function()
            functions.toggles.toggle(option)
        end
    end

    set_keymap("n", "<leader>tcl", toggle("cursorline"))
    set_keymap("n", "<leader>tet", toggle("expandtab"))
    set_keymap("n", "<leader>tic", toggle("ignorecase"))
    set_keymap("n", "<leader>tlb", toggle("linebreak"))
    set_keymap("n", "<leader>tlt", toggle("list"))
    set_keymap("n", "<leader>ts", toggle("spell"))
end

main()

return M
