return {
    "dragonlobster/harpoon-fern.nvim",
    dependencies = { "harpoon", "fern.vim", "plenary.nvim" },
    config = function()
        local configs = require("harpoon-fern")
        configs.setup()
    end
}
