local M = {}

M.config = function()
    local ok, gitsigns = pcall(require, "gitsigns")
    if not ok then
        vim.notify("gitsigns not found...")
    end

    gitsigns.setup({})
end

return M
