local ok, lualine = pcall(require, "lualine")
if not ok then
    vim.notify("lualine not found")
    return
end

lualine.setup({
    options = {
        -- 指定皮肤
        -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        theme = "tokyonight",
        -- 分割线
        component_separators = {
            left = "|",
            right = "|",
        },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = {
            left = " ",
            right = "",
        },
        globalstatus = true,
    },
    extensions = { "nvim-tree" },
    sections = {
        lualine_c = {
            "filename",
            {
                "lsp_progress",
                spinner_symbols = { " ", " ", " ", " ", " ", " " },
            },
        },
        lualine_x = {
            "filesize",
            {
                "fileformat",
                symbols = {
                    unix = "LF",
                    dos = "CRLF",
                    mac = "CR",
                },
            },
            "encoding",
            "filetype",
        },
    },
})
