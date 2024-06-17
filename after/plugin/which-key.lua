local wk = require("which-key")
local harpoon = require("harpoon")
local Path = require("plenary.path")

local function normalize_path(buf_name, root)
    return Path:new(buf_name):make_relative(root)
end

local function harpoon_add()
    if vim.bo.filetype == "fern" then
        local isdir = vim.fn["fern#is_dir"]()
        if isdir == 1 then
            vim.notify("Harpoon: Can't add directory", vim.log.levels.ERROR)
            return
        end

        local path = vim.fn["fern#get_path"]()

        local rpath = normalize_path(
            path,
            vim.loop.cwd()
        )

        local item = {
            value = rpath,
            context = {
                row = 0,
                col = 0,
            },
        }
        harpoon:list():add(item)
        vim.notify(string.format("Harpoon: Added %s to list", rpath), vim.log.levels.INFO)
    else
        harpoon:list():add()
        vim.notify(string.format("Harpoon: Added %s to list", vim.api.nvim_buf_get_name(0)), vim.log.levels.INFO)
    end
end

local function harpoon_menu()
    if vim.bo.filetype == "fern" then
        vim.notify("Harpoon: Can't open menu in fern buffer", vim.log.levels.ERROR)
        return
    end
    harpoon.ui:toggle_quick_menu(harpoon:list())
end

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
        harpoon_add,
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
                harpoon_menu,
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
