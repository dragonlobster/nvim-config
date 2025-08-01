local wk = require("which-key")
local hf = require("harpoon-fern")
local picker = require("snacks").picker
local dap = require("dap")
local dapui = require("dapui")

local function toggle_fern()
    vim.cmd("Fern . -reveal=% -stay -drawer -toggle") -- toggle Fern drawer
    vim.cmd("wincmd =")                               -- even out the size of all windows
end

local all_keys = {
    { "<leader>a",  hf.harpoon_add,           desc = "Harpoon Add" },
    { "<leader>b",  dap.toggle_breakpoint,    desc = "Breakpoint" },
    { "<leader>c",  "<cmd>confirm q<CR>",     desc = "Close Window" },
    { "<leader>d",  dapui.toggle,             desc = "Debugger" },
    { "<leader>e",  toggle_fern,              desc = "Explorer" },
    { "<leader>f",  picker.files,             desc = "Find File" },
    { "<leader>g",  group = "Git", },
    { "<leader>gg", "<cmd>LazyGit<CR>",       desc = "LazyGit" },
    { "<leader>h",  "<cmd>nohlsearch<CR>",    desc = "No Highlight" },
    { "<leader>m",  hf.harpoon_menu,          desc = "Harpoon Menu" },
    { "<leader>q",  "<cmd>confirm qa<CR>",    desc = "Quit Neovim" },
    { "<leader>s",  group = "Search" },
    { "<leader>sk", picker.keymaps,           desc = "Keymaps" },
    { "<leader>st", picker.grep,              desc = "Text" },
    { "<leader>p",  group = "Parrot" },
    { "<leader>pp", "<cmd>PrtChatToggle<cr>", desc = "Parrot Chat" },
}

wk.add(all_keys)

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
                "<cmd>lua vim.lsp.buf.format { async = true }<CR>",
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

local wkgroup = vim.api.nvim_create_augroup("wk-custom", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = wkgroup,
    pattern = { "*" },
    callback = bind_keys_nonfern
})
