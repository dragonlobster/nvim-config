return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        picker = { enabled = true },
        terminal = {
            enabled = true,
            win = {
                position = "float",
                border = "rounded",
                title = vim.fn.nr2char(127776),
                -- padding
                -- on_buf = function(win)
                --     win:add_padding()
                -- end
            }
        },
        lazygit = { enabled = true, win = { style = "lazygit" } },
        scroll = {
            enabled = true,
            -- animate = {
            --     easing = "linear",
            --     fps = 240
            -- }
        },

        ---@type table<string, snacks.win.Config>
        styles = {
            lazygit = {
                bo = {
                    filetype = "lazygit"
                }
            }
        }
    },
}
