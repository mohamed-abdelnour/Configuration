local M = {
    gitsigns = {
        "lewis6991/gitsigns.nvim",
        opt = false,
        requires = "plenary.nvim",
    },
}

M.gitsigns.config = function()
    require("gitsigns").setup({
        signs = (function()
            local keys = { "add", "change", "delete", "changedelete", "topdelete" }
            local icon = require("modules/icons").U_2503
            local icons = {}
            for _, k in ipairs(keys) do
                icons[k] = { text = icon }
            end
            return icons
        end)(),

        on_attach = function(buffer)
            local gs = require("gitsigns")

            local set_keymap = function(mode, l, r, extra_opts)
                local opts = { buffer = buffer, silent = true }
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