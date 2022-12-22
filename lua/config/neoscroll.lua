local M = {}

M.config = function()
    require("neoscroll").setup({
        respect_scrolloff = true,
        easing_function = "quadratic",
        mappings = { '<C-u>', '<C-d>', '<C-b>', 'zt', 'zz', 'zb' },
    })
end

return M
