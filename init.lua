require("basic")

require("keybindings")

require("plugins")

-- require("plugin-config.nvim-tree")

require("plugin-config.nvimtree").config()

require("plugin-config.bufferline")

-- require("plugin-config.lualine")

require("plugin-config.lualine2").config()

require("plugin-config.telescope")

require("plugin-config.project")

require("plugin-config.nvim-treesitter")

require("colors")

require("plugin-config.tokyonight").config()

require("cmd").config()
