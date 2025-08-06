return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "html", "javascript", "python", "typescript", "yaml", "dockerfile", "go", "sql" },
        highlight = {
            enable = true
        }

    }
}
