local ok, project = pcall(require, "project_vim")
if not ok then
    vim.notify("project vim not found")
    return
end

-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
    detection_methods = { "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
})

local ok, telescope = pcall(require, "telescope")
if not ok then
    vim.notify("telescope not found")
    return
end

pcall(telescope.load_extension, "projects")
