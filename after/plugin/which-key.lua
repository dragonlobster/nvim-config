local wk = require("which-key")
local harpoon = require("harpoon")

local function harpoon_add()
    if vim.bo.filetype == "fern" then
        harpoon:list():add({value = "test", context = "test"})
    else
        harpoon:list():add()
    end
end

wk.register({
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["q"] = { "<cmd>confirm q<CR>", "Quit" },
    ["e"] = { "<cmd>Fern . -width=35 -drawer -stay -toggle<CR>", "Explorer" },
    ["f"] = {
        function()
            require("telescope.builtin").find_files()
        end,
        "Find File"
    },
    g = {
        name = "Git",
        g = { "<cmd>LazyGit<CR>", "LazyGit" }
    },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["c"] = { "<cmd>bd<CR>", "Close Buffer" },
    s = {
        name = "Search",
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    },

    l = {
        name = "LSP",
        f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
    },
    ["b"] = {
        function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        "Harpoon Menu"
    },
    ["a"] = {
        harpoon_add,
        "Harpoon Add"
    }
}, { prefix = "<leader>" })

wk.register({
    ["e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Expand error" }
}, { prefix = "g" })
