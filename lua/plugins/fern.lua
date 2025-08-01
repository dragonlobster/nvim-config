return {
    {
        "lambdalisue/vim-fern"
    },
    {
        "lambdalisue/nerdfont.vim",
        dependencies = { "lambdalisue/vim-fern" }
    },
    {
        "lambdalisue/fern-git-status.vim",
        dependencies = { "lambdaliuse/vim-fern" },
        config = function()
            vim.g["fern_git_status#disable_directories"] = 1 -- don't need git status on directories
        end
    },
    {
        "lambdalisue/fern-hijack.vim",
        dependencies = { "lambdaliuse/vim-fern" }
    },
    {
        "lambdalisue/glyph-palette.vim",
        dependencies = { "lambdalisue/vim-fern", "lambdalisue/nerdfont.vim" },
    },
    {
        "lambdalisue/fern-renderer-nerdfont.vim",
        dependencies = { "lambdalisue/vim-fern", "lambdalisue/glyph-palette.vim" },
        config = function()
            vim.g["fern#renderer"] = "nerdfont"
        end
    },
    {
        "dragonlobster/harpoon-fern.nvim",
        dependencies = { "harpoon", "vim-fern", "plenary.nvim" },
        config = function()
            local configs = require("harpoon-fern")
            configs.setup()
        end
    }
}
