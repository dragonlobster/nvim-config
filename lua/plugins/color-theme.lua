return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            local configs = require("catppuccin")
            configs.setup({
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
                    }
                end

            })
        end
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }

}
