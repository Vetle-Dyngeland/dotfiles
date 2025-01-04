local map = vim.keymap.set

return {
    "Lommix/godot.nvim",
    config = function()
        local ok, godot = pcall(require, "godot")
        if not ok then return end

        godot.setup({
            bin = "godot",
        })

        local function opts(desc)
            return { desc = desc, silent = true }
        end

        map("n", "<leader>dgr", godot.debugger.debug, opts("Debug godot"))
        map("n", "<leader>dgd", godot.debugger.debug_at_cursor, opts("Debug godot at cursor"))
        map("n", "<leader>dgq", godot.debugger.quit, opts("Quit debugging godot"))
        map("n", "<leader>dgc", godot.debugger.continue, opts("Continue debugging godot"))
        map("n", "<leader>dgs", godot.debugger.step, opts("Step godot debugging"))
    end
}
