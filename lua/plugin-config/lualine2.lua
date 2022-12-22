local M = {}

local window_width_limit = 70

local function hide_in_width()
    return vim.fn.winwidth(0) > window_width_limit
end

local function env_cleanup(venv)
    if string.find(venv, "/") then
        local final_venv = venv

        for w in venv:gmatch("([^/]+)") do
            final_venv = w
        end

        venv = final_venv
    end

    return venv
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local colors = {
    bg = "#202328",
    fg = "#bbc2cf",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    purple = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
}

M.config = function()
    require("lualine").setup({
        options = {
            theme = "auto",
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "alpha", "NvimTree", "Outline" },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            },
        },
        sections = {
            lualine_a = {
                {
                    " ",
                    type = "stl",
                    -- color = { fg = "#b3e1a3" },
                },
                -- {
                --     "",
                --     type = "stl",
                --     color = { fg = "#e697a7" },
                -- },
                -- {
                --     "",
                --     type = "stl",
                --     color = { fg = "#a4b9ef" },
                -- },
            },
            lualine_b = {
                {
                    function()
                        return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                    end,
                },
                {
                    "b:gitsigns_head",
                    icon = " ",
                    color = { gui = "bold" },
                    cond = nil,
                },
                {
                    "filename",
                    color = {},
                    cond = nil,
                },
            },
            lualine_c = {
                {
                    function()
                        if not vim.bo.readonly or not vim.bo.modifiable then
                            return ""
                        end
                        return "" -- """
                    end,
                    color = { fg = "#f7768e" },
                },
                {
                    "diff",
                    source = diff_source,
                    symbols = { added = "  ", modified = " ", removed = " " },
                    diff_color = {
                        added = { fg = colors.green },
                        modified = { fg = colors.yellow },
                        removed = { fg = colors.red },
                    },
                    cond = nil,
                },
                {
                    function()
                        if vim.bo.filetype == "python" then
                            local venv = os.getenv("CONDA_DEFAULT_ENV")
                            if venv then
                                return string.format("  (%s)", env_cleanup(venv))
                            end
                            venv = os.getenv("VIRTUAL_ENV")
                            if venv then
                                return string.format("  (%s)", env_cleanup(venv))
                            end
                            return ""
                        end
                        return ""
                    end,
                    color = { fg = colors.green },
                    cond = hide_in_width,
                },
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    cond = hide_in_width,
                },
            },
            lualine_y = {
                {
                    function()
                        local b = vim.api.nvim_get_current_buf()
                        if next(vim.treesitter.highlighter.active[b]) then
                            return ""
                        end
                        return ""
                    end,
                    color = { fg = colors.green },
                    cond = hide_in_width,
                },
                {
                    function(msg)
                        msg = msg or "LS Inactive"
                        local buf_clients = vim.lsp.buf_get_clients()
                        if next(buf_clients) == nil then
                            if type(msg) == "boolean" or #msg == 0 then
                                return "[LS Inactive]"
                            end
                            return msg
                        end
                        local buf_ft = vim.bo.filetype
                        local buf_client_names = {}

                        -- add client
                        for _, client in pairs(buf_clients) do
                            if client.name ~= "null-ls" then
                                table.insert(buf_client_names, client.name)
                            end
                        end

                        -- add formatter
                        local formatters = require("null-ls.formatters")
                        local supported_formatters = formatters.list_registered(buf_ft)
                        vim.list_extend(buf_client_names, supported_formatters)

                        -- add linter
                        local linters = require("null-ls.linters")
                        local supported_linters = linters.list_registered(buf_ft)
                        vim.list_extend(buf_client_names, supported_linters)

                        return table.concat(buf_client_names, ", ")
                    end,
                    icon = { " ", color = { fg = "#ddd" } },
                    cond = hide_in_width,
                },
                {
                    "filetype",
                    cond = hide_in_width,
                },
                { "fileformat", color = { fg = "#c2e7f0" } },
            },
            lualine_z = {
                {
                    function()
                        local function format_file_size(file)
                            local size = vim.fn.getfsize(file)

                            if size <= 0 then
                                return ""
                            end

                            local sufixes = { "B", "K", "M", "G" }
                            local i = 1

                            while size > 1024 do
                                size = size / 1024
                                i = i + 1
                            end

                            local fmt = "%.1f%s"
                            if i == 1 then
                                fmt = "%d%s"
                            end

                            return string.format(fmt, size, sufixes[i])
                        end

                        local file = vim.fn.expand("%:p")

                        if string.len(file) == 0 then
                            return ""
                        end

                        return format_file_size(file)
                    end,
                    cond = function()
                        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
                    end,
                },
                { " %l/%L  %c", type = "stl" },
                {
                    function()
                        local current_line = vim.fn.line(".")
                        local total_lines = vim.fn.line("$")
                        local chars =
                            { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
                        local line_ratio = current_line / total_lines
                        local index = math.ceil(line_ratio * #chars)
                        return chars[index]
                    end,
                    padding = { left = 0, right = 0 },
                    color = { fg = colors.yellow, bg = colors.bg },
                    cond = nil,
                },
            },
        },
        inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "nvim-tree" },
    })
end

return M
