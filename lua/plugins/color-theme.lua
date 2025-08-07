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

            custom_highlights = function(colors)
                return {
                    FernWindowSelectIndicator = { fg = colors.text },
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
