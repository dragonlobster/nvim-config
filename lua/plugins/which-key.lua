return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = {
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = false,
                nav = false,
                z = false,
                g = false,
            },
        },

        ignore_missing = true,

        -- disable = {
        --     filetypes = { "fern" },
        -- },
    },
}
