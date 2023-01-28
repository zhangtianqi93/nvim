local M = {}

M.config = function()
    -- 每次保存 plugins.lua 自动安装插件
    pcall(
        vim.cmd,
        [[
            augroup packer_user_config
            au!
            au BufWritePost plugins.lua source <afile> | PackerSync
            augroup END
        ]]
    )

    -- 进入插入模式，取消行高亮，离开插入模式，打开行高亮
    pcall(
        vim.cmd,
        [[
            augroup mode_cursor_line
            au!
            au InsertEnter * :set nocursorline
            au InsertLeave * :set cursorline
            augroup END
        ]]
    )

    -- 进入插入模式，取消搜索高亮，离开插入模式，打开搜索高亮
    pcall(
        vim.cmd,
        [[
            augroup mode_search_highlight
            au!
            au InsertEnter * :set hlsearch
            au InsertLeave * :set nohlsearch
            augroup END
        ]]
    )

    -- 自动切换输入法
    pcall(
        vim.cmd,
        [[
            augroup im_select
            au!
            au InsertLeave * silent !/usr/local/bin/im-select com.apple.keylayout.ABC
            augroup END
        ]]
    )
end

return M
