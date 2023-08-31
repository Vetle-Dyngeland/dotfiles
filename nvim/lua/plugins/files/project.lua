return {
    "ahmedkhalf/project.nvim",
    keys = {
        {"<leader>pj", function()
            require("telescope").extensions.projects.projects()
        end, { desc = "Browse projects" }}
    },
    config = function()
        require("project_nvim").setup({
            patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
            prefer_startup_root = true,
            show_hidden = true,
            scope_chdir = "global",
            silent_chdir = true
        })

        local telescope = require("telescope")
        telescope.load_extension("projects")
    end
}
