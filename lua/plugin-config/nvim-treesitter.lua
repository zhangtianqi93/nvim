local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    vim.notify("nvim treesitter not found")
    return
end

treesitter.setup({
    -- 安装 languate parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = { "go", "lua", "php", "vim", "c", "json", "dot", "gitignore", "sql" },

    -- 启用代码高亮模块
    highlight = {
        enable = true,
        -- 禁用 vim 基于正则表达式的语法高亮，太慢
        additional_vim_regex_highlighting = false,
    },

    -- 启用增量选择模块
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },

    -- 启用代码缩进模块 (=)
    indent = {
        enable = true,
    },
})
