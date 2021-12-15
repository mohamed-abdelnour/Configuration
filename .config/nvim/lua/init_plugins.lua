-- Bootstrap `packer.nvim`
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "git@github.com:wbthomason/packer.nvim.git",
        install_path,
    })
end

-- Load `packer.nvim`
vim.cmd("packadd packer.nvim")
pcall(function()
    require("packer_compiled")
end)

local packer = require("packer")

-- Plug-in list
return packer.startup({
    function()
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
            opt = false,
        })

        use({
            "ms-jpq/coq_nvim",
            opt = false,
            requires = {
                {
                    "ms-jpq/coq.artifacts",
                    opt = false,
                },
            },
            setup = function()
                require("plugins/init_coq")
            end,
        })

        use({
            "nathom/filetype.nvim",
            branch = "dev",
            config = function()
                require("plugins/init_filetype")
            end,
            opt = false,
        })

        use({
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugins/init_gitsigns")
            end,
            opt = false,
            requires = "plenary.nvim",
        })

        use({
            "neovimhaskell/haskell-vim",
            ft = "haskell",
        })

        use({
            "lewis6991/impatient.nvim",
            opt = false,
        })

        use({
            "nvim-lualine/lualine.nvim",
            config = function()
                require("plugins/init_lualine")
            end,
            opt = false,
        })

        use({
            "rktjmp/lush.nvim",
            opt = false,
        })

        use({
            "iamcco/markdown-preview.nvim",
            config = function()
                require("plugins/init_markdown_preview")
            end,
            ft = "markdown",
            run = "cd app && yarn install",
        })

        use({
            "~/Projects/modus_vivendi",
            config = "vim.cmd([[colorscheme modus_vivendi]])",
            opt = false,
            requires = "lush.nvim",
        })

        use({
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require("plugins/init_null_ls")
            end,
            opt = false,
            requires = "plenary.nvim",
        })

        use({
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins/init_lsp")
            end,
            opt = false,
        })

        use({
            "bfredl/nvim-luadev",
            cmd = "Luadev",
            config = function()
                require("plugins/init_luadev")
            end,
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("plugins/init_treesitter")
            end,
            opt = false,
            run = ":TSUpdate",
        })

        use({
            "p00f/nvim-ts-rainbow",
            after = "nvim-treesitter",
            opt = false,
            requires = "nvim-treesitter",
        })

        use("wbthomason/packer.nvim")

        use({
            "nvim-lua/plenary.nvim",
            opt = false,
        })

        use({
            "simrat39/rust-tools.nvim",
            config = function()
                require("plugins/init_rust_tools")
            end,
            ft = "rust",
        })

        use({
            "lewis6991/spellsitter.nvim",
            config = function()
                require("spellsitter").setup()
            end,
            opt = false,
        })

        use({
            "nvim-telescope/telescope-fzf-native.nvim",
            opt = false,
            requires = "telescope.nvim",
            run = "make",
        })

        use({
            "nvim-telescope/telescope.nvim",
            config = function()
                require("plugins/init_telescope")
            end,
            opt = false,
            requires = "plenary.nvim",
        })

        use({
            "folke/trouble.nvim",
            cmd = "Trouble",
            config = function()
                require("plugins/init_trouble")
            end,
        })

        use({
            "dstein64/vim-startuptime",
            cmd = "StartupTime",
            config = function()
                require("plugins/init_startuptime")
            end,
        })

        use({
            "lervag/vimtex",
            config = function()
                require("plugins/init_vimtex")
            end,
            ft = "tex",
        })

        use({
            "folke/which-key.nvim",
            config = function()
                require("plugins/init_which_key")
            end,
            opt = false,
        })

        -- Bootstrap `packer.nvim`
        if packer_bootstrap then
            packer.sync()
        end
    end,

    -- Configure `packer.nvim`
    config = {
        compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
        opt_default = true,
        transitive_opt = false,
    },
})
