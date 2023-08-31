return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local ts = require("telescope.builtin")
        local map = vim.keymap.set

        map("n", "<leader>pf", ts.find_files, { desc = "Find files" })
        map("n", "<leader>pg", function()
            ts.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Find string" })
        map("n", "<leader>pr", ts.oldfiles, { desc = "Recent Files" })
        map("n", "<leader>ps", ts.resume, { desc = "Resume previous search" })
        map("n", "<leader>pc", function() ts.current_buffer_fuzzy_find() end,
            { desc = "Find string in current buffer" })
    end
}
