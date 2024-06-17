local wk = require("which-key")
local fh = require("fern-harpoon")

wk.register({
    ["q"] = { "<cmd>confirm q<CR>", "Quit" },
    ["e"] = { "<cmd>Fern . -width=35 -drawer -stay -toggle<CR>", "Explorer" },

    ["f"] = {
        function()
            require("telescope.builtin").find_files()
        end,
        "Find File"
    },

    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["c"] = { "<cmd>bd<CR>", "Close Buffer" },

    s = {
        name = "Search",
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    },
    ["a"] = {
        fh.harpoon_add,
        "Harpoon Add"
    },
    g = {
        name = "Git",
        g = { "<cmd>LazyGit<CR>", "LazyGit" }
    }
}, { prefix = "<leader>" })

local function bind_keys_nonfern()
    if vim.bo.filetype ~= "fern" then
        wk.register({
            ["w"] = { "<cmd>w!<CR>", "Save" },
            l = {
                name = "LSP",
                f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
            },
            ["b"] = {
                fh.harpoon_menu,
                "Harpoon Menu"
            },
        }, { prefix = "<leader>", buffer = 0 })
        wk.register({
            ["e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Expand error" }
        }, { prefix = "g", buffer = 0 })
    end
end

local wkgroup = vim.api.nvim_create_augroup("wk-custom", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = wkgroup,
    pattern = { "*" },
    callback = bind_keys_nonfern
})
