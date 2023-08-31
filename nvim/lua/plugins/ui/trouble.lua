return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        position = "bottom",
        width = 70,
        icons = true,
        severity = vim.diagnostic.severity.INFO,
    },
    keys = function()
        local keys = {}

        local function opts(description)
            return { desc = description, noremap = true }
        end

        table.insert(keys, { "<leader>dt", "<cmd>TroubleToggle<cr>", opts("Toggle Trouble") })
        table.insert(keys,
            { "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts("Toggle Trouble workspace diagnostics") })
        table.insert(keys,
            { "<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>", opts("Toggle Trouble document diagnostics") })
        table.insert(keys, { "<leader>dl", "<cmd>TroubleToggle loclist<cr>", opts("Toggle Trouble loclist") })

        return keys
    end,
    config = function()
    end
}
