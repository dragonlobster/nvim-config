return {
    {
        "stevearc/overseer.nvim",
        opts = {},
    },
    {
        "Civitasv/cmake-tools.nvim",
        name = "cmake-tools",
        dependencies = { "overseer.nvim" },
        opts = {}
    }
}
