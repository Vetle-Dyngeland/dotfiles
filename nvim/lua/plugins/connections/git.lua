return {
    "kdheepak/lazygit.nvim",
    keys = {
        { "<leader>g", "<cmd>LazyGit<cr>", { desc = "Open lazygit" } }
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end
}
