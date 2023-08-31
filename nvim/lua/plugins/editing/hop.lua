return {
    "phaazon/hop.nvim",
    config = function()
        local hop = require("hop")
        hop.setup()

        local map = vim.keymap.set
        local function opts(description)
            return { remap = true, desc = description }
        end

        local directions = require("hop.hint").HintDirection

        map("", "f", function()
            hop.hint_char1({
                direction = directions.AFTER_CURSOR,
                current_line_only = true
            })
        end, opts("Hop: single line search after cursor"))
        map("", "F", function()
            hop.hint_char1({
                direction = directions.BEFORE_CURSOR,
                current_line_only = true
            })
        end, opts("Hop: single line search before cursor"))
        map("", "t", function()
            hop.hint_char1({
                direction = directions.AFTER_CURSOR,
                current_line_only = true,
                hint_offset = -1
            })
        end, opts("Hop: single line search after cursor"))
        map("", "T", function()
            hop.hint_char1({
                direction = directions.BEFORE_CURSOR,
                current_line_only = true,
                hint_offset = 1
            })
        end, opts("Hop: single line search before cursor"))

        map("", "gc", "<cmd>HopChar1<cr>", { desc = "Hop: character search" })
        map("", "gC", "<cmd>HopChar2<cr>", { desc = "Hop: two characters search" })

        map("", "gp", "<cmd>HopPattern<cr>", { desc = "Hop: pattern search" })
        map("", "gw", "<cmd>HopWord<cr>", { desc = "Hop: word search" })
    end
}
