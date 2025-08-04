--local title = vim.api.nvim_buf_get_name(0)

-- TODO: use for lazygit only, right now applies to all snack_terminal filetypes
vim.keymap.set("t", "q", "<cmd>close<cr>", { buffer = true })
