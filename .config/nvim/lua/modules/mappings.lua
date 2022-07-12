local M = {}

local main = function()
    local opt = vim.opt

    -- Leader keys
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    local set_keymap = vim.keymap.set

    -- Delete buffer
    set_keymap("n", "<leader>k", "<cmd>bd<cr>")
    set_keymap("n", "<leader>K", "<cmd>%bd<cr>")

    -- Diff
    set_keymap("n", "<leader>db", "<cmd>diffget BASE<cr>")
    set_keymap("n", "<leader>dl", "<cmd>diffget LOCAL<cr>")
    set_keymap("n", "<leader>dr", "<cmd>diffget REMOTE<cr>")

    -- nohlsearch
    set_keymap("n", "<c-l>", "<cmd>nohlsearch<cr>")

    -- Toggles
    set_keymap("n", "<leader>tcl", opt:toggle("cursorline"))
    set_keymap("n", "<leader>tet", opt:toggle("expandtab"))
    set_keymap("n", "<leader>tic", opt:toggle("ignorecase"))
    set_keymap("n", "<leader>tlb", opt:toggle("linebreak"))
    set_keymap("n", "<leader>tlt", opt:toggle("list"))
    set_keymap("n", "<leader>ts", opt:toggle("spell"))

    local colorcolumn = function()
        opt:toggle("colorcolumn", function()
            if next(opt.colorcolumn:get()) == nil then
                local tw = opt.textwidth:get()
                return tw ~= 0 and tostring(tw) or "80"
            else
                return ""
            end
        end)
    end
    set_keymap("n", "<leader>tcc", colorcolumn)

    set_keymap("n", "<leader>t ", require("modules.spaceless").toggle)
end

main()

return M
