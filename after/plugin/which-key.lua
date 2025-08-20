local wk = require("which-key")
--local hf = require("harpoon-fern")
local picker = require("snacks").picker
local lazygit = require("snacks").lazygit
local terminal = require("snacks").terminal
local dap = require("dap")
local dapui = require("dapui")
local conform = require("conform")
local arrow_persist = require("arrow.persist")
local arrow_buffer_persist = require("arrow.buffer_persist")

vim.keymap.set({ "n", "t" }, "<C-Bslash>", terminal.toggle)

local function toggle_fern()
    vim.cmd("Fern . -reveal=% -stay -drawer -toggle") -- toggle Fern drawer
    vim.cmd("wincmd =")                               -- even out the size of all windows
end

local function arrow_toggle()
    local line_nr = vim.api.nvim_win_get_cursor(0)[1]
    local col_nr = vim.api.nvim_win_get_cursor(0)[2]
    local bufnr = vim.api.nvim_get_current_buf()
    arrow_persist.save(bufnr, line_nr, col_nr)
end

vim.keymap.set("n", "<leader>a", arrow_toggle, { desc = "Arrow Add" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Breakpoint" })
vim.keymap.set("n", "<leader>d", dapui.toggle, { desc = "Debugger" })
vim.keymap.set("n", "<leader>e", toggle_fern, { desc = "Explorer" })
vim.keymap.set("n", "<leader>f", picker.files, { desc = "Find File" })
vim.keymap.set("n", "<leader>gg", lazygit.open, { desc = "LazyGit" })
--vim.keymap.set("n", "<leader>m", hf.harpoon_menu, { desc = "Harpoon Menu" })
vim.keymap.set("n", "<leader>sk", picker.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>st", picker.grep, { desc = "Text" })
vim.keymap.set("n", "<leader>sf", picker.files, { desc = "Find File" })

local all_groups = {
    { "<leader>g", group = "Git", },
    { "<leader>s", group = "Search" },
}

wk.add(all_groups)

-- AI Assistant
if vim.tbl_get(require("lazy.core.config"), "plugins", "codecompanion.nvim", "_", "loaded")
then
    wk.add({
        { "<leader>p", group = "CodeCompanion", mode = { "v", "n" }, desc = "AI Assistant" },
    })
    vim.keymap.set("n", "<leader>pp", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat Toggle" })
    vim.keymap.set({ "v", "n" }, "<leader>pa", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
    vim.keymap.set("v", "<leader>pp", "<cmd>CodeCompanion<cr>", { desc = "AI Prompt" })
end


-- which keys that are only for filetype buffers
local function bind_keys_nonfern()
    if vim.bo.filetype ~= "fern" then
        -- keymaps that don't belong in fern buffer
        wk.add({
            { "<leader>l", group = "LSP" },
        })
        vim.keymap.set("n", "<leader>lf", conform.format, { desc = "Format", buffer = true })
        vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>", { desc = "Save", buffer = true })
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = bind_keys_nonfern
})
