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

-- Plugin list
return packer.startup({
    function()
        -- Colour scheme
        use({ "rktjmp/lush.nvim", opt = false })

        use({
            "~/Projects/modus_vivendi/",
            config = "vim.cmd([[colorscheme modus_vivendi]])",
            opt = false,
        })

        -- Completion
        use({
            "ms-jpq/coq_nvim",
            config = function()
                require("plugins/init_coq")
            end,
            opt = false,
            requires = {
                { "ms-jpq/coq.artifacts", opt = false },
            },
        })

        -- LSP
        use({
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins/init_lsp")
            end,
            ft = { "haskell", "python", "rust" },
            requires = { "nvim-lua/lsp-status.nvim" },
            wants = { "lsp-status.nvim" },
        })

        -- Telescope
        use({
            "nvim-telescope/telescope.nvim",
            config = function()
                require("plugins/init_telescope")
            end,
            cmd = "Telescope",
            module = "telescope.builtin",
            requires = {
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            },
            wants = { "plenary.nvim", "telescope-fzf-native.nvim" },
        })

        -- Tree-sitter
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
        })

        use({
            "lewis6991/spellsitter.nvim",
            config = function()
                require("spellsitter").setup()
            end,
        })

        -- Miscellaneous
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
            opt = false,
        })

        use({
            "nathom/filetype.nvim",
            config = function()
                require("plugins/init_filetype")
            end,
            opt = false,
        })

        use({ "neovimhaskell/haskell-vim", ft = "haskell" })

        use({ "lewis6991/impatient.nvim", opt = false })

        use({
            "iamcco/markdown-preview.nvim",
            config = function()
                require("plugins/init_markdown_preview")
            end,
            ft = "markdown",
            run = "cd app && yarn install",
        })

        use({
            "sbdchd/neoformat",
            cmd = "Neoformat",
            config = function()
                require("plugins/init_neoformat")
            end,
        })

        use({
            "bfredl/nvim-luadev",
            cmd = "Luadev",
            config = function()
                require("plugins/init_luadev")
            end,
        })

        use({
            "simrat39/rust-tools.nvim",
            config = function()
                require("plugins/init_rust_tools")
            end,
            ft = "rust",
        })

        use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

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

        -- `packer.nvim`
        use("wbthomason/packer.nvim")

        -- Bootstrap `packer.nvim`
        if packer_bootstrap then
            require("packer").sync()
        end
    end,

    -- Configure `packer.nvim`
    config = {
        compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
        opt_default = true,
        transitive_opt = false,
    },
})
