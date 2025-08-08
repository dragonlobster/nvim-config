vim.g["fern#renderer"] = "nerdfont"
vim.g["fern_git_status#disable_directories"] = 1 -- don't need git status on directories

-- hide dirs/files
local hide_dirs = "^\\%(\\.git\\|node_modules\\)$"
local hide_files = "\\%(\\.DS_Store\\)\\+"

vim.g["fern#default_exclude"] = hide_dirs .. "\\|" .. hide_files
vim.g["fern#default_hidden"] = 1

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
    },
    {
        "dragonlobster/harpoon-fern.nvim",
        dependencies = { "harpoon", "vim-fern", "plenary.nvim" }
    }
}
