return {
    "ray-x/lsp_signature",
    config = function()
        require("lsp_signature").setup({
            bind = true,
            handler_opts = {
                border = "rounded"
            },

        })
    end
}
