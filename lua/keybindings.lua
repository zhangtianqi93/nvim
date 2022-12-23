-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 取消 s 默认功能
map("n", "s", "", opt)

-- Windows 分屏快捷键
map("n", "sl", ":vsp<cr>", opt)
map("n", "sj", ":sp<cr>", opt)

-- 关闭当前
map("n", "sc", "<c-w>c", opt)

-- 关闭其他
map("n", "so", "<c-w>o", opt)

-- 窗口之间跳转
map("n", "<tab>", "<c-w><c-w>", opt)
map("n", "<a-h>", "<c-w>h", opt)
map("n", "<a-l>", "<c-w>l", opt)
map("n", "<a-k>", "<c-w>k", opt)
map("n", "<a-j>", "<c-w>j", opt)
map("n", "<c-h>", "<c-w>h", opt)
map("n", "<c-j>", "<c-w>j", opt)
map("n", "<c-k>", "<c-w>k", opt)
map("n", "<c-l>", "<c-w>l", opt)

-- 等比例
map("n", "s=", "<c-w>=", opt)

-- visual 模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下移动选中的文本
map("v", "J", ":move '>+1<cr>gv-gv", opt)
map("v", "K", ":move '<-2<cr>gv-gv", opt)

-- 上下滚动浏览代码
map("n", "<c-j>", "5j", opt)
map("n", "<c-k>", "5k", opt)

-- ctrl-u / ctrl-d 只移动 9 行，默认半屏
map("n", "<c-u>", "9k", opt)
map("n", "<c-d>", "9j", opt)

-- 在 visual 模式下粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
map("n", "q", ":q<cr>", opt)
map("n", "qq", ":q!<cr>", opt)
map("n", "Q", ":qa!<cr>", opt)

-- insert 模式下，跳转到行首/行尾
map("i", "<c-h>", "<esc>I", opt)
map("i", "<c-l>", "<esc>A", opt)

-- 跳转到行首/行尾巴
map("n", "H", "^", opt)
map("n", "L", "$", opt)
map("n", "U", "<c-r>", opt)
map("i", "jj", "<esc>", opt)
map("i", "jk", "<esc>", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- nvim-tree
map("n","<a-m>", ":NvimTreeToggle<cr>", opt)
map("n","<c-n>", ":NvimTreeToggle<cr>", opt)

-- bufferline
-- 左右切换 Tab
map("n", "<c-h>", ":BufferLineCyclePrev<cr>", opt)
map("n", "<c-l>", ":BufferLineCycleNext<cr>", opt)
map("n", "tp", ":BufferLineCyclePrev<cr>", opt)
map("n", "tn", ":BufferLineCycleNext<cr>", opt)

-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- hop.nvim
map("", ";", "<cmd>HopChar1<cr>", opt)
map("", ",", "<cmd>HopLineStartMW<cr>", opt)


local M = {}

M.nvimTreeList = {
    -- 分屏打开文件
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    -- 打开文件或者文件夹
    { key = { "<cr>", "o", "<2-LeftMouse>"}, action = "edit" },
    -- 显示隐藏文件
    { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom
    { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
    -- 文件操作
    { key = "<F5>", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "s", action = "system_open" },
}

-- Telescope 列表中 插入模式快捷键
M.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",

        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",

        -- 关闭窗口
        ["<C-c>"] = "close",

        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

return M
