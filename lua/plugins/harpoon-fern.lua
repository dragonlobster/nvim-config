return {
    "dragonlobster/harpoon-fern.nvim",
    dependencies = { "harpoon", "vim-fern", "plenary.nvim" },
    config = function()
        local configs = require("harpoon-fern")
        configs.setup()
    end
}
