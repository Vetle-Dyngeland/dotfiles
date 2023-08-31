return {
    "kelly-lin/ranger.nvim",
    keys = {
        { "<leader>pv", 
            "<cmd>lua require(\"ranger-nvim\").open(true)<cr>"
        , { desc = "File explorer" }}
    },
    config = function()
        local ranger = require("ranger-nvim")
        ranger.setup({
            replace_netwr = true,
            enable_cmds = true,
        })
    end
}
