return {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
        require("leap").create_default_mappings()

        -- indicate when leap is active
        vim.api.nvim_create_autocmd("User", {
            pattern = "LeapEnter",
            callback = function()
                print(vim.fn.nr2char(129432))
            end,
        }
        )
        vim.api.nvim_create_autocmd("User", {
            pattern = "LeapLeave",
            callback = function()
                print(" ")
            end,
        }
        )
    end,
    lazy = false
}
