return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "helix",
        plugins = {
            marks = false,
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = true,
                nav = false,
                z = false,
                g = false,
            },
        },
        delay = 0,
        sort = { "alphanum" }
    },
}
