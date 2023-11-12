return {
    "mfussenegger/nvim-dap",
    dependencies = {
        { "rcarriga/nvim-dap-ui", event = "VeryLazy" },
    },
    config = function()
        local dap = require("dap")

        dap.adapters["pwa-node"] = {
            type = "server",
            host = "127.0.0.1",
            port = 8123,
            executable = {
                command = "js-debug-adapter"
            },
        }

        for _, language in ipairs { "typescript", "javascript" } do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    runtimeExecutable = "node"
                },
            }
        end

        local dapui = require("dapui")
        require("dapui").setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.after.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.after.event_exited["dapui_config"] = function()
            dapui.close()
        end

        local map = vim.keymap.set

        map("n", "<leader>dr", "<cmd>DapContinue<cr>", { desc = "Dap: Continue debugger" })
        map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Dap: Toggle breakpoints" })
    end
}
