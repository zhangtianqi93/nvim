local ok, nvimTree = pcall(require, "nvim-tree")
if not ok then
    vim.notify("nvim-tree not found")
    return
end

local listKeys = require("keybindings").nvimTreeList

nvimTree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },

    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },

    -- 隐藏 . 文件和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },

    view = {
        -- 宽度
        width = 40,
        -- 也可以 right
        side = "left",
        -- 隐藏根目录
        hide_root_folder = false,
        -- 自定义列表快捷键
        mappings = {
            custom_only = false,
            list = listKeys,
        },
        -- 关闭行号
        number = false,
        -- 关闭相对行号
        relativenumber = false,
        -- 显示图标
        signcolumn = "yes",
    },

    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
        },
    },

    system_open = {
        cmd = "open",
    },
})
