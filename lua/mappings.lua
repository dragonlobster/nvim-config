vim.g.mapleader = ","
vim.keymap.set("n", "<C-s>", ":w<CR>")  -- save file

vim.keymap.set("n", "|", ":vsplit<CR>") -- vertical split
vim.keymap.set("n", "_", ":split<CR>") -- horizontal split

vim.keymap.set("n", "0", "^")           -- swap beginning of line
vim.keymap.set("n", "^", "0")           -- swap beginning of line

vim.keymap.set("n", "<C-d>", "15jzz")   -- center while scrolling down
vim.keymap.set("n", "<C-u>", "15kzz")   -- center while scrolling up

vim.keymap.set("n", "<C-e>", "5<C-e>")  -- scroll down more
vim.keymap.set("n", "<C-y>", "5<C-y>")  -- scroll up more

vim.keymap.set("n", "<C-k>", "<C-W>k")  -- split navigation
vim.keymap.set("n", "<C-j>", "<C-W>j")  -- split navigation
vim.keymap.set("n", "<C-h>", "<C-W>h")  -- split navigation
vim.keymap.set("n", "<C-l>", "<C-W>l")  -- split navigation

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- visual mode move up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- visual mode move down

vim.keymap.set("n", "n", "nzzzv") -- cursor stays in middle on n (find next)
vim.keymap.set("n", "N", "Nzzzv") -- cursor stays in middle on N (find next reverse)

vim.keymap.set("n", "Q", "<nop>") -- never press Q

