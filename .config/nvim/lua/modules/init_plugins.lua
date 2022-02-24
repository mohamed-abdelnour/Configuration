local M = {}

local bootstrap = function()
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        packer_bootstrap = vim.fn.system({
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
    pcall(function()
        require("packer_compiled")
    end)

    packer = require("packer")
end

main()

M = packer.startup({
    function(use)
        local use_plugin = function(suffix)
            plugins = require("plugins/init_" .. suffix)
            for _, plugin in pairs(plugins) do
                use(plugin)
            end
        end

        local use_plugins = function(plugins)
            for _, v in ipairs(plugins) do
                use_plugin(v)
            end
        end

        use_plugins({
            "comment",
            "coq",
            "filetype",
            "gitsigns",
            "heirline",
            "languages",
            "lsp",
            "miscellaneous",
            "null_ls",
            "telescope",
            "treesitter",
            "trouble",
            "vimtex",
        })

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
