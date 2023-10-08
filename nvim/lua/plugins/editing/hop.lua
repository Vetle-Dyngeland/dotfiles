return {
    "phaazon/hop.nvim",
    config = function()
        local hop = require("hop")
        hop.setup()

        local map = vim.keymap.set

        map("", "gc", "<cmd>HopChar1<cr>", { desc = "Hop: character search" })
        map("", "gC", "<cmd>HopChar2<cr>", { desc = "Hop: two characters search" })

        map("", "gp", "<cmd>HopPattern<cr>", { desc = "Hop: pattern search" })
        map("", "gw", "<cmd>HopWord<cr>", { desc = "Hop: word search" })
    end
}
