local m = {}

m.config = function()
    -- nvim-tree 支持
    -- vim.g.nvim_tree_respect_buf_cwd = 1

    require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    })

    require("telescope").load_extension("projects")
end

return m
