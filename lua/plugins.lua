local packer = require("packer")

packer.startup({
    function(use)
        use({ 'wbthomason/packer.nvim' })

        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use({ "arkav/lualine-lsp-progress" })

        use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })

        use({ "mhinz/vim-startify" })

        use({ "ahmedkhalf/project.nvim" })

        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

        -- telescope extensions
        use({ "LinArcX/telescope-env.nvim" })

        use({
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        })

        -- 光标移动
        use({
            "phaazon/hop.nvim",
            branch = "v2",
            cmd = "Hop*",
            config = function()
                require("hop").setup({})
            end,
        })

        use({
            "fatih/vim-go"
        })

        -- 主题
        use({ "ful1e5/onedark.nvim" })
        use({ "shaunsingh/nord.nvim" })
        use({ "folke/tokyonight.nvim" })
        use({ "EdenEast/nightfox.nvim" })
        use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })

    end,

    config = {
        max_jobs = 16,
        display = {
            open_fn = require("packer.util").float,
        },
    },
})
