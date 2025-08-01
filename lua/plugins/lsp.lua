return {
    "neovim/nvim-lspconfig",
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = { "rafamadriz/friendly-snippets" },

        -- use a release tag to download pre-built binaries
        version = "1.*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = "cargo build --release",
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = "nix run .#build-plugin",

        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            -- "default" (recommended) for mappings similar to built-in completions (C-y to accept)
            -- "super-tab" for mappings similar to vscode (tab to accept)
            -- "enter" for enter to accept
            -- "none" for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = "enter" },

            appearance = {
                -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono"
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = {
                menu = { border = "rounded" },
                documentation = { auto_show = true },
                list = { selection = { auto_insert = false } }
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },

                -- only show when keyword is 3 or more characters long
                providers = {
                    cmdline = {
                        min_keyword_length = function(ctx)
                            -- if there is no empty space, the minimium is 3 (because empty space means passing an argument)
                            -- if the first letter is lowercased, the minimum is 3 (upper case are usually plug in commands)
                            if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil
                                and ctx.line:sub(1, 1) == string.lower(ctx.line:sub(1, 1))
                            then
                                return 3
                            end
                            return 0
                        end
                    }
                }
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" },

            cmdline = {
                keymap = {
                    ["<Tab>"] = { "show_and_insert", "select_next" },
                    ["<S-Tab>"] = { "show_and_insert", "select_prev" },

                    ["<C-space>"] = { "show", "fallback" },

                    ["<Down>"] = { "select_next", "fallback" },
                    ["<Up>"] = { "select_prev", "fallback" },

                    ["<CR>"] = { "accept", "fallback" },
                    ["<C-c>"] = { "cancel" },
                },
                completion = {
                    menu = {
                        auto_show = function(_)
                            return vim.fn.getcmdtype() == ":"
                        end
                    },
                    list = { selection = { auto_insert = false, preselect = false } }
                }
            }

        },
        opts_extend = { "sources.default" }
    }
}
