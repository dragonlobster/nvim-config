vim.g.mapleader = ","
vim.keymap.set("n", "<C-s>", ":w<cr>")       -- save file

vim.keymap.set("n", "|", ":vsplit<cr>")      -- vertical split
vim.keymap.set("n", "_", ":split<cr>")       -- horizontal split

vim.keymap.set("n", "0", "^")                -- swap beginning of line
vim.keymap.set("n", "^", "0")                -- swap beginning of line

vim.keymap.set("n", "<C-d>", "15jzz")        -- center while scrolling down
vim.keymap.set("n", "<C-u>", "15kzz")        -- center while scrolling up

vim.keymap.set("n", "<C-e>", "5<C-e>")       -- scroll down more
vim.keymap.set("n", "<C-y>", "5<C-y>")       -- scroll up more

vim.keymap.set("n", "<C-k>", "<C-W>k")       -- split navigation
vim.keymap.set("n", "<C-j>", "<C-W>j")       -- split navigation
vim.keymap.set("n", "<C-h>", "<C-W>h")       -- split navigation
vim.keymap.set("n", "<C-l>", "<C-W>l")       -- split navigation

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv") -- visual mode move up
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv") -- visual mode move down

vim.keymap.set("n", "n", "nzzzv")            -- cursor stays in middle on n (find next)
vim.keymap.set("n", "N", "Nzzzv")            -- cursor stays in middle on N (find next reverse)

vim.keymap.set("n", "Q", "<nop>")            -- don't press Q (accidentally trigger macro)
-- vim.keymap.set("n", "Q", "@q")            -- Q to trigger macro @q

vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Copy Selection (System Clipboard)" })
vim.keymap.set("n", "<leader>y", [["+Y]], { desc = "Copy Line (System Clipboard)" })
vim.keymap.set("n", "<leader>Y", [[ggVG"+y]], { desc = "Copy File (System Clipboard)" })

vim.keymap.set("n", "<leader>c", "<cmd>confirm q<cr>", { desc = "Close Window" })
vim.keymap.set("n", "<leader>q", "<cmd>confirm qa<cr>", { desc = "Quit Neovim" })


-- no highlight
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })

-- vim.keymap.set("n", "+", "j")                -- go up
-- vim.keymap.set("n", "-", "k")                -- go down
-- vim.keymap.set("n", "j", "+")                -- go down to first non-emtpy character
-- vim.keymap.set("n", "k", "-")                -- go up to first non-empty character

-- Open compiler
vim.keymap.set("n", "<F5>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
