return {
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig"
        },
        config = function()
            local status = require("lsp-status")
            status.register_progress()

            require("rust-tools").setup({
                flags = { allow_incremental_sync = true, debounce_text_changes = 1000 },
                root_dir = require("lspconfig").util.root_pattern("Cargo.toml"),
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            autoReload = true
                        },
                        inlayHints = {
                            maxLength = 50,
                            closingBraceHints = {
                                enable = true,
                                minLines = 30
                            },
                        }
                    },
                    on_attach = status.on_attach,
                    capabilities = status.capabilities
                }
            })
        end
    },
    {
        "Saecki/crates.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufRead Cargo.toml",
        config = function()
            require("crates").setup()
        end
    },
}
