-- Bootstrap `packer.nvim`
local install_path = vim.fn.stdpath("data")
    .. "/site/pack/packer/opt/packer.nvim"
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
            "~/Projects/modus-vivendi/",
            config = "vim.cmd([[colorscheme modus-vivendi]])",
            opt = false,
        })

        -- Completion
        use({
            "ms-jpq/coq_nvim",
            config = function()
                require("plugins/init-coq")
            end,
            opt = false,
            requires = { { "ms-jpq/coq.artifacts", opt = false } },
        })

        -- LSP
        use({
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins/init-lsp")
            end,
            ft = { "haskell", "python", "rust" },
        })

        -- Telescope
        use({
            "nvim-telescope/telescope.nvim",
            config = function()
                require("plugins/init-telescope")
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
        use({ "p00f/nvim-ts-rainbow", opt = false })
        use({
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("plugins/init-treesitter")
            end,
            opt = false,
        })

        -- Miscellaneous
        use({
            "nathom/filetype.nvim",
            config = function()
                require("plugins/init-filetype")
            end,
            opt = false,
        })

        use({ "lewis6991/impatient.nvim", opt = false })

        use({
            "iamcco/markdown-preview.nvim",
            config = function()
                require("plugins/init-markdown-preview")
            end,
            ft = "markdown",
            run = "cd app && yarn install",
        })

        use({
            "sbdchd/neoformat",
            cmd = "Neoformat",
            config = function()
                require("plugins/init-neoformat")
            end,
        })

        use({ "neovimhaskell/haskell-vim", ft = "haskell" })

        use({ "dstein64/vim-startuptime", cmd = "StartupTime" })

        use({
            "lervag/vimtex",
            config = function()
                require("plugins/init-vimtex")
            end,
            ft = "tex",
        })

        use({
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup()
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
