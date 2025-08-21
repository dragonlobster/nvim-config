return {
    {
        "zbirenbaum/copilot.lua",
        opts = {}
    },

    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        priority = 49,
        opts = function()
            local function conceal_tag(icon, hl_group)
                return {
                    on_node = { hl_group = hl_group },
                    on_closing_tag = { conceal = "" },
                    on_opening_tag = {
                        conceal = "",
                        virt_text_pos = "inline",
                        virt_text = { { icon .. " ", hl_group } },
                    },
                }
            end

            return {
                preview = {
                    filetypes = { "markdown", "codecompanion" },
                    ignore_buftypes = {},
                    modes = { "i", "n", "no", "c" },
                    hybrid_modes = { "i" },
                    linewise_hybrid_mode = true,
                },

                html = {
                    container_elements = {
                        ["^buf$"]         = conceal_tag("", "CodeCompanionChatVariable"),
                        ["^file$"]        = conceal_tag("", "CodeCompanionChatVariable"),
                        ["^help$"]        = conceal_tag("󰘥", "CodeCompanionChatVariable"),
                        ["^image$"]       = conceal_tag("", "CodeCompanionChatVariable"),
                        ["^symbols$"]     = conceal_tag("", "CodeCompanionChatVariable"),
                        ["^url$"]         = conceal_tag("󰖟", "CodeCompanionChatVariable"),
                        ["^var$"]         = conceal_tag("", "CodeCompanionChatVariable"),
                        ["^tool$"]        = conceal_tag("", "CodeCompanionChatTool"),
                        ["^user_prompt$"] = conceal_tag("", "CodeCompanionChatTool"),
                        ["^group$"]       = conceal_tag("", "CodeCompanionChatToolGroup"),
                    },
                },
            }
        end,
    },

    {
        "olimorris/codecompanion.nvim",
        opts =
            function()
                local local_adapter = "copilot"
                if os.getenv("OPENROUTER_API_KEY")
                then
                    local_adapter = "openrouter"
                end
                return
                {
                    strategies = {
                        chat = {
                            adapter = local_adapter
                        },
                        inline = {
                            adapter = local_adapter
                        }
                    },

                    adapters = {
                        openrouter = function()
                            return require("codecompanion.adapters").extend("openai_compatible", {
                                env = {
                                    url = "https://openrouter.ai/api",
                                    api_key = os.getenv("OPENROUTER_API_KEY"),
                                    chat_url = "/v1/chat/completions",
                                },
                                schema = {
                                    model = {
                                        default = "anthropic/claude-3.7-sonnet",
                                    },
                                },
                            })
                        end,
                    },

                    display = {
                        action_palette = {
                            prompt = vim.fn.nr2char(0x1f916)
                        },
                        chat = {
                            window = {
                                width = 0.35,
                                opts = {
                                    winfixwidth = true,
                                    number = false
                                }
                            }
                        }
                    },

                }
            end
        ,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "OXY2DEV/markview.nvim",
            "zbirenbaum/copilot.lua"
        }
    }
}
