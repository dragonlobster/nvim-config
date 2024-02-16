local wk = require("which-key")
local harpoon = require("harpoon")

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
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    --["c"] { "<cmd>BufferKill<CR>", "Close Buffer" },
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
            "Barpoon Menu"
    },
    ["a"] = {
        function()
            harpoon:list():append()
        end,
        "Barpoon Add"
    },
}, { prefix = "<leader>" })
