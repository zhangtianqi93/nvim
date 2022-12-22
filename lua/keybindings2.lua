local m = {}

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

m.config = function()
    -- leader key
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- 取消 s 默认功能
    map("n", "s", "", opt)

    -- 分屏
    map("n", "sl", ":vs<cr>", opt)
    map("n", "sj", ":sp<cr>", opt)

    -- 关闭当前
    map("n", "sc", "<c-w>c", opt)

    -- 关闭其他
    map("n", "so", "<c-w>o", opt)

    -- 窗口之间跳转
    -- map("n", "<tab>", "<c-w><c-w>", opt)
    map("n", "<c-h>", "<c-w>h", opt)
    map("n", "<c-j>", "<c-w>j", opt)
    map("n", "<c-k>", "<c-w>k", opt)
    map("n", "<c-l>", "<c-w>l", opt)

    -- 上下移动选中的文本
    map("i", "<a-j>", "<esc>:m .+1<CR>==gi", opt)
    map("i", "<a-k>", "<Esc>:m .-2<CR>==gi", opt)
    map("n", "<a-j>", ":m .+1<CR>==", opt)
    map("n", "<a-k>", ":m .-2<CR>==", opt)
    map("v", "J", ":move '>+1<cr>gv-gv", opt)
    map("v", "K", ":move '<-2<cr>gv-gv", opt)
    map("v", "<a-j>", ":m '>+1<CR>gv-gv", opt)
    map("v", "<a-k>", ":m '<-2<CR>gv-gv", opt)

    -- visual 模式下缩进代码
    map("v", "<", "<gv", opt)
    map("v", ">", ">gv", opt)

    -- 快速移动
    map("n", "J", "5j", opt)
    map("n", "K", "5k", opt)
    -- map("n", "<c-u>", "10k", opt)
    -- map("n", "<c-d>", "10j", opt)

    -- visual 模式里粘贴不要复制
    map("v", "p", '"_dP', opt)

    -- 退出
    map("n", "q", ":q<cr>", opt)
    map("n", "qq", ":q!<cr>", opt)
    map("n", "Q", ":qa!<cr>", opt)

    -- insert 模式下，跳转到行首行尾
    map("i", "<c-h>", "<esc>I", opt)
    map("i", "<c-l>", "<esc>A", opt)

    -- 其他快捷键
    map("n", "L", "$", opt)
    map("n", "H", "^", opt)
    map("n", "U", "<c-r>", opt)
    map("i", "jk", "<esc>", opt)
    map("i", "jj", "<esc>", opt)

    -- 搜索
    -- map("n", "n", "'Nn'[v:searchforward]", opt)
    -- map("n", "N", "'nN'[v:searchforward]", opt)

    -- clever-f.nvim
    -- map("c", "<c-a>", "<c-b>", { noremap = true })

    -- hop.nvim
    map("", ";", "<cmd>HopChar1<cr>", opt)
    map("", ",", "<cmd>HopLineStartMW<cr>", opt)

    map("n", "<c-n>", ":NvimTreeToggle<CR>", opt)

    map("n", "tn", ":BufferLineCycleNext<cr>", opt)
    map("n", "tp", ":BufferLineCyclePrev<cr>", opt)
    map("n", "<leader>b", ":Bdelete!<cr>", opt)
    map("n", "<leader>p", ":BufferLinePickClose<cr>", opt)

    -- Telescope
    map("n", "<c-p>", ":Telescope find_files<cr>", opt)
    map("n", "<c-f>", ":Telescope live_grep<cr>", opt)
end

m.mapLSP = function(mapbuf)
    mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
    mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
    mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
    mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
    mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
end

m.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),

        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),

        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),

        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),

        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    }
end

return m
