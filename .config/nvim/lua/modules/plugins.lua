local packer = nil
local packer_bootstrap = nil

local bootstrap = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim.git",
            install_path,
        })
    end
end

local main = function()
    bootstrap()

    -- Load `packer.nvim`
    vim.cmd("packadd packer.nvim")
    Error:guard(function()
        require("packer_compiled")
    end)

    packer = require("packer")
end

main()

local M = packer.startup({
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

        use("wbthomason/packer.nvim")

        if packer_bootstrap then
            packer.sync()
        end
    end,

    -- Configure `packer.nvim`
    config = {
        compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
        opt_default = true,
        transitive_opt = false,
        profile = {
            enable = true,
        },
    },
})

return M
