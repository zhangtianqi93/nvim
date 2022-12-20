local packer = require("packer")

packer.startup({
    function(use)
        use 'wbthomason/packer.nvim'

        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

        -- 主题
        use("folke/tokyonight.nvim")
        -- use("gruvbox-community/gruvbox")
        use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
        use("ful1e5/onedark.nvim")
        use("shaunsingh/nord.nvim")
        use("EdenEast/nightfox.nvim")
    end,
    config = {
        max_jobs = 16,
        display = {
            open_fn = require("packer.util").float,
        },
    },
})
