return {
    {
        "Mofiqul/vscode.nvim",
        config = function()
            require("vscode").setup({
                italic_comments = false,
                transparent = false,
                disable_nvimtree_bg = false,
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "moon",
                dim_inactive = true,
            })
        end
    },
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup({
                toggle_style_key = "<leader>od",
                code_style = {
                    comments = "none",
                },
                diagnostics = {
                    darker = false,
                    undercurl = false,
                }
            })
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                show_end_of_buffer = true,
                term_colors = true,
                styles = {
                    conditionals = {},
                },
            })

            vim.cmd("colorscheme catppuccin-macchiato")
        end
    },
}
