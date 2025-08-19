local wk = require("which-key")
local hf = require("harpoon-fern")
local picker = require("snacks").picker
local lazygit = require("snacks").lazygit
local terminal = require("snacks").terminal
local dap = require("dap")
local dapui = require("dapui")
local conform = require("conform")
--local parrot = require("parrot")

-- after keymaps that are instant (no need which key)
vim.keymap.set({ "n", "t" }, "<C-Bslash>", terminal.toggle)
--vim.keymap.set("t", "<C-Bslash>", "<C-Bslash><C-n><cmd>FloatermToggle<CR>")

local function toggle_fern()
    vim.cmd("Fern . -reveal=% -stay -drawer -toggle") -- toggle Fern drawer
    vim.cmd("wincmd =")                               -- even out the size of all windows
end

local all_keys = {
    { "<leader>a",  hf.harpoon_add,        desc = "Harpoon Add" },
    { "<leader>b",  dap.toggle_breakpoint, desc = "Breakpoint" },
    { "<leader>c",  "<cmd>confirm q<CR>",  desc = "Close Window" },
    { "<leader>d",  dapui.toggle,          desc = "Debugger" },
    { "<leader>e",  toggle_fern,           desc = "Explorer" },
    { "<leader>f",  picker.files,          desc = "Find File" },
    { "<leader>g",  group = "Git", },
    { "<leader>gg", lazygit.open,          desc = "LazyGit" },
    { "<leader>h",  "<cmd>nohlsearch<CR>", desc = "No Highlight" },
    { "<leader>m",  hf.harpoon_menu,       desc = "Harpoon Menu" },
    { "<leader>q",  "<cmd>confirm qa<CR>", desc = "Quit Neovim" },
    { "<leader>s",  group = "Search" },
    { "<leader>sk", picker.keymaps,        desc = "Keymaps" },
    { "<leader>st", picker.grep,           desc = "Text" },
    { "<leader>sf", picker.files,          desc = "Find File" },
}

wk.add(all_keys)

-- if parrot is enabled then add the keys to which-key
local codecompanion_keys = {
    { "<leader>p",  group = "CodeCompanion",             mode = { "v", "n" },    desc = "AI Assistant" },
    { "<leader>pp", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat Toggle" },
    { "<leader>pa", "<cmd>CodeCompanionActions<cr>",     mode = { "v", "n" },    desc = "AI Actions" },
    { "<leader>pp", "<cmd>CodeCompanion<cr>",            mode = { "v" },         desc = "AI Prompt" }
}

if vim.tbl_get(require("lazy.core.config"), "plugins", "codecompanion.nvim", "_", "loaded")
then
    wk.add(codecompanion_keys)
end


-- which keys that are only for filetype buffers
local function bind_keys_nonfern()
    if vim.bo.filetype ~= "fern" then
        local non_fern_keys = {
            {
                "<leader>l",
                group = "LSP",
                buffer = 0
            },
            {
                "<leader>lf",
                conform.format,
                --"<cmd>lua vim.lsp.buf.format { async = true }<CR>",
                desc = "Format",
                buffer = 0
            },
            {
                "<leader>w",
                "<cmd>w!<CR>",
                desc = "Save",
                buffer = 0
            },
            {
                "ge",
                "<cmd>lua vim.diagnostic.open_float()<CR>",
                desc = "Expand error",
                buffer = 0
            },
        }
        wk.add(non_fern_keys)
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = bind_keys_nonfern
})
