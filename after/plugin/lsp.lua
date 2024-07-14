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

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_setup = function(server)
    if server ~= "tsserver" then
        require("lspconfig")[server].setup({
            capabilities = lsp_capabilities,
        })
    end
end

local lsp_servers = {
    "lua_ls",
    "html",
    "dockerls",
    "docker_compose_language_service",
    "clangd",
    "pyright",
    "tsserver",
    "gopls"
}

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = lsp_servers,
    handlers = {
        default_setup,
    },
})

local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },
    mapping = cmp.mapping.preset.insert({
        -- Enter key confirms completion item
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Ctrl + space triggers completion menu
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})

require("lspconfig").lua_ls.setup({
    capabilities = lsp_capabilities,
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
