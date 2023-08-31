return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function() vim.g.barbar_auto_setup = false end,
    keys = function()
        local keys = {}

        local function opts(description)
            return { silent = true, noremap = true, desc = description }
        end

        table.insert(keys, { "<A-,>", "<cmd>BufferPrevious<cr>", opts("BarBar: Previous buffer") })
        table.insert(keys, { "<A-.>", "<cmd>BufferNext<cr>", opts("BarBar: Next buffer") })

        table.insert(keys, { "<A-<>", "<cmd>BufferMovePrevious<cr>", opts("BarBar: Move buffer left") })
        table.insert(keys, { "<A->>", "<cmd>BufferMoveNext<cr>", opts("BarBar: Move buffer right") })

        table.insert(keys, { "<A-b>", function()
            local idx = vim.fn.input("Buffer index > ")
            vim.cmd("BufferGoto " .. idx)
        end, opts("Goto buffer at index") })

        table.insert(keys, { "<A-p>", "<cmd>BufferPin<cr>", opts("Pin buffer") })
        table.insert(keys, { "<A-c>", "<cmd>BufferClose!<cr>", opts("Close buffer") })
        return keys
    end,
    config = function()
        require("barbar").setup({
            animation = false,
            auto_hide = true,
            clickable = false,
            icons = {
                buffer_index = true,
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = { enabled = true },
                    [vim.diagnostic.severity.WARN] = { enabled = true },
                    [vim.diagnostic.severity.INFO] = { enabled = true },
                },
                seperator_at_end = false,
            },
            minimum_length = 0,
            maximum_length = 15,
            sidebar_filetypes = {
                NvimTree = false,
            },

        })
    end,
}
