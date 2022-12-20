local packer = require("packer")

packer.startup({
    function(use)
        use 'wbthomason/packer.nvim'

        -- 主题
        use("folke/tokyonight.nvim")
    end,
    config = {
        max_jobs = 16,
        display = {
            open_fn = require("packer.util").float,
        },
    },
})
