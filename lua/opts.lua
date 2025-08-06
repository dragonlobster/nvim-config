-- which-key timeout
vim.opt.timeoutlen = 50

-- spacing/indent
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.smartindent = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = true
vim.opt.number = true

--noswap/undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50

vim.opt.incsearch = true

-- splitright
vim.opt.splitright = true

-- remove blinking cursor in neovim terminal
vim.opt.guicursor:remove { "t:block-blinkon500-blinkoff500-TermCursor" }
