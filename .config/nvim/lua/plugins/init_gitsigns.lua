local M = {
    gitsigns = {
        "lewis6991/gitsigns.nvim",
        opt = false,
        requires = "plenary.nvim",
    },
}

M.gitsigns.config = function()
    local signs = require("modules/init_icons").set_icons({
        input = { "add", "change", "delete", "changedelete", "topdelete" },
        icon = "U_2503",
        fn = function(r, _, v, icon)
            r[v] = { text = icon }
        end,
    })

    require("gitsigns").setup({
        signs = signs,

        on_attach = function(buffer)
            local gs = package.loaded.gitsigns

            local set_keymap = function(mode, l, r, extra_opts)
                opts = { buffer = buffer, silent = true }
                if extra_opts then
                    opts = vim.tbl_extend("keep", extra_opts, opts)
                end
                vim.keymap.set(mode, l, r, extra_opts)
            end

            set_keymap("n", "<leader>hR", gs.reset_buffer)
            set_keymap("n", "<leader>hS", gs.stage_buffer)
            set_keymap("n", "<leader>hd", gs.diffthis)
            set_keymap("n", "<leader>hp", gs.preview_hunk)
            set_keymap("n", "<leader>hu", gs.undo_stage_hunk)
            set_keymap("n", "<leader>tb", gs.toggle_current_line_blame)
            set_keymap("n", "<leader>td", gs.toggle_deleted)
            set_keymap("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'", { expr = true })
            set_keymap("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'", { expr = true })
            set_keymap({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<cr>")
            set_keymap({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<cr>")
            set_keymap({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")
            set_keymap("n", "<leader>hD", function()
                gs.diffthis("~")
            end)
            set_keymap("n", "<leader>hb", function()
                gs.blame_line({ full = true })
            end)
        end,
    })
end

return M
