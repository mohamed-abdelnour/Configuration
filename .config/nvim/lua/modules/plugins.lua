local fn = vim.fn

local M = {}

M.bootstrapped = false

M.bootstrap = function()
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        M.bootstrapped = fn.system({
            "git",
            "clone",
            "--depth=1",
            "https://github.com/wbthomason/packer.nvim.git",
            install_path,
        })

        vim.cmd("packadd packer.nvim")
    end
end

local main = function()
    Error:aggregate(function()
        M.bootstrap()

        local MODULE = "packer_compiled"
        local compile_path = table.concat({
            fn.stdpath("data"),
            "/site/pack/cache/start/cache/lua/",
            MODULE,
            "/init.lua",
        })

        local packer = require("packer")

        packer.startup({
            function(use)
                local use_plugin = function(suffix)
                    Table.from(require("plugins." .. suffix)):iter():for_each(use)
                end

                Table.from({
                    "comment",
                    "completion",
                    "gitsigns",
                    "heirline",
                    "languages",
                    "lsp",
                    "miscellaneous",
                    "null_ls",
                    "telescope",
                    "treesitter",
                    "vimtex",
                })
                    :iter()
                    :for_each(use_plugin)

                if M.bootstrapped then
                    packer.sync()
                else
                    require(MODULE)
                end
            end,

            config = {
                compile_path = compile_path,
                opt_default = true,
                transitive_opt = false,
                profile = {
                    enable = true,
                },
            },
        })
    end)
end

main()

return M
