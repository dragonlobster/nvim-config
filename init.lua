-- keymaps
require("mappings")

-- options
require("opts")

-- help
--vim.cmd("source " .. nvimrc .. "vim/help.vim")

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- lazy plugins
require("lazy").setup("plugins")

-- refresh outside file changes
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    pattern = { "*" },
    command = "if mode() != 'c' | checktime | endif",
})

vim.cmd.colorscheme "catppuccin"

vim.loader.enable()
