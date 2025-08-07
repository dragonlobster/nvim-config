local wk = require("which-key")

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        -- these will be buffer-local keybindings
        -- because they only work if you have an active language server
        wk.add(
            {
                { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>",     buffer = 0, desc = "Declaration" },
                { "gR", "<cmd>lua vim.lsp.buf.rename()<cr>",          buffer = 0, desc = "Rename" },
                { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>",      buffer = 0, desc = "Definition" },
                { "gh", "<cmd>lua vim.lsp.buf.hover()<cr>",           buffer = 0, desc = "Hover" },
                { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>",  buffer = 0, desc = "Implementation" },
                { "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", buffer = 0, desc = "Type defintion" },
                { "gr", "<cmd>lua vim.lsp.buf.references()<cr>",      buffer = 0, desc = "References" },
                { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>",  buffer = 0, desc = "Signature" },
            }
        )
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end
})


local lsp_servers = {
    "lua_ls",
    "html",
    "dockerls",
    "docker_compose_language_service",
    "clangd",
    "pyright",
    "ts_ls",
    "gopls",
    "clangd"
}

require("mason-lspconfig").setup({
    ensure_installed = lsp_servers
})

vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = true,
    signs = {
        priority = 300,
        text = {
            [vim.diagnostic.severity.ERROR] = " ", -- 󰅚
            [vim.diagnostic.severity.WARN] = " ", -- 󰀪
            [vim.diagnostic.severity.INFO] = " ", -- 󰋽
            [vim.diagnostic.severity.HINT] = "󰠠 ", -- 󰌶
        },
    },
    virtual_text = {
        source = "if_many",
        spacing = 2,
        prefix = "",
    }
})


vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            diagnostics = {
                globals = { "vim", "utf8" },
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                }
            }
        }
    }
})

-- vim.lsp.config("*", {
--     capabilities = require("blink.cmp").get_lsp_capabilities(nil, true),
--     root_markers = { ".git" },
-- })
