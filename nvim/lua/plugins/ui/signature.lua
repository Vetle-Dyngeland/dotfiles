return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        require 'lsp_signature'.setup({
            doc_lines = 7,
            max_height = 10,
            max_width = 100,
            hint_enable = false,
            handler_opts= {
                border = "single"
            },
        })
    end
}
