return {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
        require("leap").create_default_mappings()

        -- TODO: add group

        -- indicate when leap is active
        vim.api.nvim_create_autocmd("User", {
            pattern = "LeapEnter",
            callback = function()
                vim.notify(vim.fn.nr2char(129432)) -- when leap is active show kangaroo
            end,
        }

        -- indicate when leap is left
        )
        vim.api.nvim_create_autocmd("User", {
            pattern = "LeapLeave",
            callback = function()
                vim.notify(" ") -- clear notification when leap is left
            end,
        }
        )
    end,
    --lazy = false
}
