return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                init = function()
                    local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
                    local opts = require("lazy.core.plugin").values(plugin, "opts", false)
                    local enabled = false

                    if opts.textobjects then
                        for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
                            if opts.textobjects[mod] and opts.textobjects[mod].enable then
                                enabled = true
                                break
                            end
                        end
                    end
                    if not enabled then
                        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    end
                end
            }
        },
        keys = {
            { "<c-space>", desc = "Increment Selection" },
            { "<bs>",      desc = "Decrement selection", mode = "x" }
        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            auto_install = true,
            ensure_installed = {
                "lua",
                "luadoc",
                "luap",
                "rust",
                "vim",
            },
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = { enable = true },
                indent = { enable = true },
                context_commentstring = { enable = true, enable_autocmd = false },
                auto_install = true,
                ensure_installed = {
                    "lua",
                    "luadoc",
                    "luap",
                    "rust",
                    "vim",
                },
            })
        end
    }
}
