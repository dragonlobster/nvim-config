return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "html", "javascript", "python", "typescript", "yaml", "dockerfile", "go", "sql", "markdown", "markdown_inline" },
        highlight = {
            enable = true
        }
    },
    lazy = false,
    priority = 50,
    dependencies = {
        "OXY2DEV/markview.nvim"
    }
}
