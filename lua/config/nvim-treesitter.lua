local M = {}

M.config = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "json", "html", "css", "vim", "lua", "javascript", "go", "bash", "c", "gomod", "php", "proto", "sql", "toml" },
        -- 启用代码高亮模块
        highlight = {
            enable = true, -- 开启语法高亮
            additional_vim_regex_highlighting = false, -- 关闭 vim 的正则语法高亮
        },
        -- 启用增量选择模块
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<cr>",
                node_incremental = "<cr>",
                node_decremental = "<bs>",
                scope_incremental = "<tab>",
            },
        },
        -- 启用代码缩进模块 (=)
        indent = {
            enable = true,
        },
    })


    -- 开启 Folding 模块
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

    -- 默认不要折叠
    -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    vim.opt.foldlevel = 99

end

return M
