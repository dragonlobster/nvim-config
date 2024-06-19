local wk = require("which-key")
local hf = require("harpoon-fern")

wk.register({
    ["q"] = { "<cmd>confirm qa<CR>", "Quit Neovim" },
    ["e"] = {
        function()
            vim.cmd("Fern . -reveal=% -stay -drawer -toggle") -- toggle Fern drawer
            vim.cmd("wincmd =") --even out the size of all windows
        end
        ,
        "Explorer"
    },

    ["f"] = {
        function()
            require("telescope.builtin").find_files()
        end,
        "Find File"
    },

    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["c"] = { "<cmd>confirm q<CR>", "Close Window" },

    s = {
        name = "Search",
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    },
    ["a"] = {
        hf.harpoon_add,
        "Harpoon Add"
    },
    g = {
        name = "Git",
        g = { "<cmd>LazyGit<CR>", "LazyGit" }
    },
    ["b"] = {
        hf.harpoon_menu,
        "Harpoon Menu"
    },
}, { prefix = "<leader>" })

-- which keys that are only for non-fern buffers
local function bind_keys_nonfern()
    if vim.bo.filetype ~= "fern" then
        wk.register({
            ["w"] = { "<cmd>w!<CR>", "Save" },
            l = {
                name = "LSP",
                f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
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
