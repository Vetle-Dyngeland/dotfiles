return {
    "kosayoda/nvim-lightbulb",
    config = function()
        require("nvim-lightbulb").setup({
            autocmd = { enabled = true },
            sign = { enabled = true },
            virtual_text = { enabled = false },
            float = { enabled = false },
            status_text = { enabled = false },
            number = { enabled = false },
            line = { enabled = false },
        })
    end
}
