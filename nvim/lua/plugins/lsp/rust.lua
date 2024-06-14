return {
    --[[{
        "mrcjkb/rusteceanvim",
        version = "^4",
        lazy = false,
        config = function()
            local bufnr = vim.api.nvim_get_current_buf()
            vim.keymap.set("n", "<leader>a", function() vim.cmd.RustLsp("codeAction") end,
                { silent = true, buffer = bufnr })

            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                autoReload = true,
                                allFeatures = true,
                            },
                            inlayHints = {
                                maxLength = 50,
                                closingBraceHints = {
                                    enable = true,
                                    minLines = 30
                                },
                            }
                        }
                    }
                }
            }
        end
    },]]
    {
        "Saecki/crates.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufRead Cargo.toml",
        config = function()
            require("crates").setup()
        end
    },
}
