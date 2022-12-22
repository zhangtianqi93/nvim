local m = {}

m.config = function()
    -- UTF8
    vim.g.encoding = "UTF-8"
    vim.opt.fileencoding = "UTF-8"

    -- 使用系统剪切板
    vim.o.clipboard = "unnamedplus"

    -- jkhl 移动时，光标周围保留几行
    vim.opt.scrolloff = 8
    vim.opt.sidescrolloff = 8

    -- 使用相对行号
    vim.wo.number = true
    vim.wo.cursorline = true
    vim.wo.relativenumber = true

    -- 显示左侧图标指示列
    vim.wo.signcolumn = "yes"

    -- 右侧参考线
    -- vim.wo.colorcolumn = "80"

    -- tab 缩紧配置
    vim.opt.tabstop = 4
    vim.bo.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftround = true

    -- >> << 时移动的长度
    vim.opt.shiftwidth = 4
    vim.bo.shiftwidth = 4

    -- 空格替代 tab
    vim.opt.expandtab = true
    vim.bo.expandtab = true

    -- 新行相对当前行对齐
    vim.opt.autoindent = true
    vim.bo.autoindent = true
    vim.opt.smartindent = true

    -- 搜索大小写不敏感
    vim.opt.smartcase = true
    vim.opt.ignorecase = true

    -- 搜索不高亮
    vim.opt.hlsearch = false

    -- 一边输入一边搜索
    vim.opt.incsearch = true

    -- 命令行高度为 2 提供足够的显示空间
    vim.opt.cmdheight = 1

    -- 当文件被外部程序修改之后，自动加载
    vim.opt.autoread = true
    vim.bo.autoread = true

    -- 禁止折行
    vim.wo.wrap = false

    -- 光标在行首行尾时，<Left><Right> 可以跳到下一行
    vim.opt.whichwrap = "<,>,[,]"

    -- 允许隐藏被修改过的 buffer
    vim.opt.hidden = true

    -- 鼠标支持
    -- vim.o.mouse = "a"

    -- 禁止创建备份文件
    vim.opt.backup = false
    vim.opt.swapfile = false
    vim.opt.writebackup = false

    -- smaller updatetime
    vim.opt.updatetime = 300

    -- 设置 timeoutlen 为等待键盘快捷键连击时间 500 毫秒
    vim.opt.timeoutlen = 500
    vim.opt.ttimeoutlen = 10
    vim.opt.redrawtime = 1500

    -- split window 从下边和右边出现
    vim.opt.splitbelow = true
    vim.opt.splitright = true

    -- 自动补全不自动选中
    vim.g.completeopt = { "menu", "menuone", "noselect" }

    -- 样式
    vim.opt.background = "dark"
    vim.opt.termguicolors = true

    -- 不可见的字符显示
    vim.opt.list = true
    vim.opt.listchars = "tab:→ ,eol:↵,trail:·,space:·,extends:↷,precedes:↶"

    -- 补全增强
    vim.opt.wildmenu = true

    -- Don't pass message to |ins-completin munu|
    vim.opt.shortmess = vim.o.shortmess .. "c"

    -- 补全最多显示几行
    vim.opt.pumheight = 10

    -- 永远显示 tabline
    vim.opt.showtabline = 2

    -- 使用增强状态栏插件后不在需要 vim 的模式提示
    vim.opt.showmode = false

    -- make vim prompt me to save before doing destructive things
    vim.opt.confirm = true

    vim.opt.fillchars = {
        fold = " ",
        eob = " ", -- suppress ~ at EndOfBuffer
        diff = "╱", -- alternatives = ⣿ ░ ─
        msgsep = "‾",
        foldopen = "▾",
        foldsep = "│",
        foldclose = "▸",
        horiz = "━",
        horizup = "┻",
        horizdown = "┳",
        vert = "┃",
        vertleft = "┫",
        vertright = "┣",
        verthoriz = "╋",
    }

    vim.opt.shortmess = {
        t = true, -- truncate file messages at start
        A = true, -- ignore annoying swap file messages
        o = true, -- file-read message overwrites previous
        O = true, -- file-read message overwrites previous
        T = true, -- truncate non-file messages in middle
        f = true, -- (file x of x) instead of just (x of x
        F = true, -- Don't give file info when editing a file, NOTE: this breaks autocommand messages
        s = true,
        c = true,
        W = true, -- Don't show [w] or written when writing
    }

    -- vim 光标
    vim.opt.guicursor = "n:block-blinkon10,i-ci:ver15-blinkon10,c:hor15-blinkon10,v-sm:block,ve:ver15,r-cr-o:hor10"
end

return m
