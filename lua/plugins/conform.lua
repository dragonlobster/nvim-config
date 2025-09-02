return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "fixjson" },
            lua = { "stylua" }
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
    },
}
