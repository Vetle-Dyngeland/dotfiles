return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99

        require("ufo").setup({
            provider_selector = function(_, _, _)
                return { 'treesitter', 'indent' }
            end,
            open_fold_hl_timeout = 200,
        })
    end
}
