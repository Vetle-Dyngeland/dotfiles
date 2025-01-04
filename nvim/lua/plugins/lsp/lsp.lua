return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        {
            "williamboman/mason.nvim",
            build = function()
                pcall(vim.cmd, "MasonUpdate")
            end,
            dependencies = "williamboman/mason-lspconfig.nvim"
        },

        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",

        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        -- This is where you enable features that only work
        -- if there is a language server active in the file
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local opts = function(description)
                    return { buffer = event.buf, desc = description }
                end

                local map = vim.keymap.set

                map("n", "<leader>f", function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
                    opts("Format"))
                map("n", "gd", function() vim.lsp.buf.definition() end, opts("Go to definition"))
                map("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts("Toggle Trouble lsp_references"))
                map("n", "K", function() vim.lsp.buf.hover() end, opts("Lsp hover"))
                map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts("Open floating diagnostics"))
                map("n", "<leader>va", "<cmd>CodeActionMenu<cr>", opts("Code action"))
                map("n", "<leader>vn", function() vim.diagnostic.goto_next() end, opts("Go to next diagnostic"))
                map("n", "<leader>vN", function() vim.diagnostic.goto_prev() end, opts("Go to previous diagnostic"))
                map("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("Rename (vim)"))
                map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts("Signature help"))
            end
        })

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "rust_analyzer" },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,

                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                runtime = {
                                    version = "LuaJIT"
                                },
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                                telemetry = {
                                    enable = false,
                                },
                            }
                        }
                    })
                end,

                --[[gdscript = function()
                    require("lspconfig").gdscript.setup({
                        on_attach = function(client)
                            local _notify = client.notify
                            client.notify = function(method, params)
                                if method == "textDocument/didClose" then
                                    -- Godot doesn't implement didClose yet
                                    return
                                end
                                _notify(method, params)
                            end
                        end
                    })
                end,]]
            }
        })

        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp = require("cmp")

        local cmp_mappings = cmp.mapping.preset.insert({
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-space>"] = cmp.mapping.complete({}),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    require("luasnip").expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    require("luasnip").jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        })

        cmp.setup({
            mapping = cmp_mappings,
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
                { name = "codeium" }
            }
        })

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰘥 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
            },
            virtual_text = true,
            underline = true,
            severity_sort = true,
        })

        -- If exiting insert mode, stop allowing luasnip to jump to previous jumpable place
        vim.api.nvim_create_autocmd('ModeChanged', {
            pattern = '*',
            callback = function()
                if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
                    and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
                    and not require('luasnip').session.jump_active
                then
                    require('luasnip').unlink_current()
                end
            end
        })
    end
}
