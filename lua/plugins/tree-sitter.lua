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
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
        "OXY2DEV/markview.nvim"
    }
}
