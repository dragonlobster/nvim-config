return {
    {
        "lambdalisue/fern.vim",
        config = function()
            local function init_fern()
                vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = true });
                vim.keymap.set("n", "<C-h>", "<C-w>h", { buffer = true });
                vim.opt_local.number = false
                vim.opt_local.fillchars = { eob = " " }

                -- fern expand collapse
                local function fern_smart_leaf()
                    return vim.fn["fern#smart#leaf"](
                        "<Plug>(fern-action-open:select)",
                        "<Plug>(fern-action-expand-tree)",
                        "<Plug>(fern-action-collapse)"
                    )
                end

                vim.keymap.set("n", "<Plug>(fern-smart-leaf)", fern_smart_leaf,
                    { buffer = true, expr = true, remap = false })
                vim.keymap.set("n", "<CR>", "<Plug>(fern-smart-leaf)", { buffer = true, nowait = true })
            end

            local ferngroup = vim.api.nvim_create_augroup("fern-custom", { clear = true })
            vim.api.nvim_create_autocmd("FileType",
                {
                    group = ferngroup,
                    pattern = { "fern" },
                    callback = init_fern,
                })
        end
    },
    {
        "lambdalisue/nerdfont.vim",
        dependencies = { "lambdalisue/fern.vim" }
    },
    {
        "lambdalisue/fern-git-status.vim",
        dependencies = { "lambdaliuse/fern.vim" },
        config = function()
            vim.g["fern_git_status#disable_directories"] = 1

            local hide_dirs = "^\\%(\\.git\\|node_modules\\)$"
            --local hide_files = "\\%(\\.byebug\\|\\.ruby-\\)\\+"

            vim.g["fern#default_exclude"] = hide_dirs --.. "\\|" .. hide_files
            vim.g["fern#default_hidden"] = 1
        end
    },
    {
        "lambdalisue/fern-hijack.vim",
        dependencies = { "lambdaliuse/fern.vim" }
    },
    {
        "lambdalisue/glyph-palette.vim",
        dependencies = { "lambdalisue/fern.vim", "lambdalisue/nerdfont.vim" },
        config = function()
            local glyphgroup = vim.api.nvim_create_augroup("glyph-custom", { clear = true })

            local function init_glyph_palette()
                return vim.fn["glyph_palette#apply"]()
            end

            vim.api.nvim_create_autocmd("FileType",
                {
                    group = glyphgroup,
                    pattern = { "fern" },
                    callback = init_glyph_palette,
                })
        end
    },
    {
        "lambdalisue/fern-renderer-nerdfont.vim",
        dependencies = { "lambdalisue/fern.vim", "lambdalisue/glyph-palette.vim" },
        config = function()
            vim.g["fern#renderer"] = "nerdfont"
        end
    }
}
