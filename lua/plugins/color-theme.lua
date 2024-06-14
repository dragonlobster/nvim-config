--vim.cmd.colorscheme "catppuccin"
return {
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
                telescope = {
                    enabled = true,
                }
            }
        })
        vim.cmd.colorscheme "catppuccin"
    end
}

