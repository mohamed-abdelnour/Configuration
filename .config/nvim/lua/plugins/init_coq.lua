local M = {
    coq = {
        "ms-jpq/coq_nvim",
        opt = false,
    },
}

M.coq.config = function()
    vim.g.coq_settings = {
        auto_start = "shut-up",
        clients = {
            snippets = {
                warn = {},
            },
        },
        display = {
            icons = {
                mode = "none",
            },
            pum = {
                fast_close = false,
            },
        },
    }
    require("coq")
end

return M
