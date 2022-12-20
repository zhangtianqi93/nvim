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
map("n", "<a-h>", "<c-w>h", opt)
map("n", "<a-l>", "<c-w>l", opt)
map("n", "<a-k>", "<c-w>k", opt)
map("n", "<a-j>", "<c-w>j", opt)

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

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })
