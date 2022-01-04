require("plugins/init_lsp").init_server({
    name = "tsserver",
    init_options = require("nvim-lsp-ts-utils").init_options,
    hook = function(client, _)
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({
            auto_inlay_hints = false,
            filter_out_diagnostics_by_code = { 80001 },
        })
        ts_utils.setup_client(client)
    end,
})
