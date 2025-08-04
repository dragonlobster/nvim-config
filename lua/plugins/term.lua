return {
    "voldikss/vim-floaterm",
    config = function()
        vim.keymap.set("n", "<C-Bslash>", "<cmd>FloatermToggle<CR>")
        vim.keymap.set("t", "<C-Bslash>", "<C-Bslash><C-n><cmd>FloatermToggle<CR>")
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_title = "🐉"
    end
}
