return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "macchiato",
            integrations = {
                fern = true,
                which_key = true,
                blink_cmp = {
                    style = "bordered"
                }
            },

            styles = {
                keywords = { "italic" },
                booleans = { "italic" },
            },

            custom_highlights = function(colors)
                return {
                    -- fern highlight groups
                    FernWindowSelectIndicator = { fg = colors.text },
                    GlyphPalette9 = { fg = colors.sapphire },
                    FernNormal = { bg = colors.mantle },

                    -- status line highlight groups
                    MiniStatuslineModeNormal = { bg = colors.mauve },
                    MiniStatuslineModeInsert = { bg = colors.sky },
                    MiniStatuslineModeVisual = { bg = colors.lavender }
                }
            end
        }
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }

}
