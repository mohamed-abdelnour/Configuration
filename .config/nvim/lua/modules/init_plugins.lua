local M = {}

local function bootstrap()
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

local function main()
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
        local function use_plugin(suffix)
            plugins = require("plugins/init_" .. suffix)
            for _, plugin in pairs(plugins) do
                use(plugin)
            end
        end

        use_plugin("comment")
        use_plugin("coq")
        use_plugin("filetype")
        use_plugin("gitsigns")
        use_plugin("languages")
        use_plugin("lsp")
        use_plugin("lualine")
        use_plugin("miscellaneous")
        use_plugin("null_ls")
        use_plugin("telescope")
        use_plugin("theme")
        use_plugin("treesitter")
        use_plugin("trouble")
        use_plugin("vimtex")

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
