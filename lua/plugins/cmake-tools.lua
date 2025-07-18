return {
    {
        "stevearc/overseer.nvim",
        opts = {},
    },
    {
        "Civitasv/cmake-tools.nvim",
        name = "cmake-tools",
        dependencies = { "overseer.nvim" },
        config = function()
            local cmake = require("cmake-tools")
            cmake.setup({})
        end
    }
}
