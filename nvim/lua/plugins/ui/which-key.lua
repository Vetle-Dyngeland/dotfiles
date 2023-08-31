return {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local wk = require("which-key")
        wk.setup()

        wk.register({
            ["<leader>p"] = { name = "Files" },
            ["<leader>r"] = { name = "Rename" },
            ["<leader>o"] = { name = "Other" },
            ["<leader>h"] = { name = "Harpoon" },
            ["<leader>v"] = { name = "Lsp" },
            ["<leader>w"] = { name = "Window" },
        })
    end
}
