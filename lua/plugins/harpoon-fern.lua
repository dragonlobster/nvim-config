return {
    name = "harpoon-fern",
    dir = "/Users/Fake/Projects/harpoon-fern",
    dependencies = { "harpoon", "fern.vim", "plenary.nvim" },
    config = function()
        local configs = require("harpoon-fern")
        configs.setup()
    end
}
