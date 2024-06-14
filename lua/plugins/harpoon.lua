return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "telescope.nvim", "plenary.nvim" },
    config = function()
        local configs = require("harpoon")
        configs:setup({
            settings = {
                save_on_toggle = true
            }
        })
    end

}
