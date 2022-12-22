local m = {}

local packer = require("packer")

packer.startup({
    function(use)
        -- 管理自身
        use("wbthomason/packer.nvim")

        -- 屏幕滚动
        use({
            "karb94/neoscroll.nvim",
            event = "WinScrolled",
            config = function()
                require("user.config.neoscroll").config()
            end,
        })

        -- 光标移动
        use({
            "rhysd/clever-f.vim",
            keys = { "f", "F", "t", "T" },
            setup = function()
                vim.g.clever_f_smart_case = 1
                vim.g.clever_f_across_no_line = 1
                vim.g.clever_f_fix_key_direction = 1
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
            "andymass/vim-matchup",
            event = "CursorMoved",
            setup = function()
                vim.g.matchup_surround_enabled = 1
                vim.g.matchup_matchparen_offscreen = { method = "popup" }
            end,
        })

        -- 主题
        use({
            "folke/tokyonight.nvim",
            branch = "main",
            config = function()
                require("user.config.tokyonight").config()
                vim.cmd([[colorscheme tokyonight]])
            end,
            -- 根据条件展示
            cond = function()
                local _time = os.date("*t")
                return _time.hour >= 15 and _time.hour <= 24
            end,
        })

        use({
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("user.config.catppuccin").config()
                vim.cmd([[colorscheme catppuccin]])
            end,
            -- 根据条件展示
            cond = function()
                local _time = os.date("*t")
                return (_time.hour >= 0 and _time.hour < 15)
            end,
        })

        -- 其他主题
        use({
            "ful1e5/onedark.nvim",
            disable = true,
            config = function()
                vim.cmd([[colorscheme onedark]])
            end,
        })
        use({ "shaunsingh/nord.nvim", disable = true })
        use({ "EdenEast/nightfox.nvim", disable = true })
        use({ "mhartington/oceanic-next", disable = true })
        use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" }, disable = true })

        use({
            "nacro90/numb.nvim",
            event = "BufRead",
            config = function()
                require("numb").setup({
                    show_numbers = true, -- Enable 'number' for the window while peeking
                    show_cursorline = true, -- Enable 'cursorline' for the window while peeking
                    number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
                    centered_peeking = true, -- Peeked line will be centered relative to window
                })
            end,
        })

        use({
            "wfxr/minimap.vim",
            disable = true,
            run = "cargo install --locked code-minimap",
            -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
            config = function()
                vim.g.minimap_width = 10
                vim.g.minimap_auto_start = 1
                vim.g.minimap_auto_start_win_enter = 1
            end,
        })

        use({
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons", -- optional, for file icons
            },
            config = function()
                require("user.config.nvimtree").config()
            end,
            tag = "nightly", -- optional, updated every week. (see issue #1193)
        })

        use({
            "akinsho/bufferline.nvim",
            tag = "v2.*",
            requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
            config = function()
                require("user.config.bufferline").config()
            end,
        })

        use({
            "lewis6991/gitsigns.nvim",
            config = function()
                require("user.config.gitsigns").config()
            end,
        })

        use({
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("user.config.lualine").config()
            end,
        })

        use("arkav/lualine-lsp-progress")

        use({
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("user.config.telescope").config()
            end,
        })

        use({
            "goolord/alpha-nvim",
            disable = true,
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("alpha").setup(require("alpha.themes.dashboard").config)
            end,
        })

        use({
            "glepnir/dashboard-nvim",
            config = function()
                require("user.config.dashboard").config()
            end,
        })

        use({
            "ahmedkhalf/project.nvim",
            config = function()
                require("user.config.project").config()
            end,
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("user.config.nvim-treesitter").config()
            end,
        })

        -- lsp
        use({ "williamboman/nvim-lsp-installer" })

        -- Lspconfig
        use({ "neovim/nvim-lspconfig" })

        -- 补全引擎
        use("hrsh7th/nvim-cmp")

        -- snippet 引擎
        use("hrsh7th/vim-vsnip")

        -- 补全源
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")

        use({
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        })

        use({ "onsails/lspkind-nvim", disable = false })

        use({
            "lukas-reineke/indent-blankline.nvim",
            disable = false,
            config = function()
                require("user.config.indent-blankline").config()
            end,
        })

        use({ "tami5/lspsaga.nvim", disable = false })

        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

        -- JSON 增强
        use("b0o/schemastore.nvim")

        use({ "github/copilot.vim" })
    end,

    config = {
        -- 并发数
        max_jobs = 16,

        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
        },

        -- 以浮动窗口打开安装列表
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})

m.config = function()
    --
end

return m
