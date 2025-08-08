vim.fn["glyph_palette#apply"]()

vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = true });                       -- focus to the right
vim.keymap.set("n", "<C-h>", "<C-w>h", { buffer = true });                       -- focus to the left
vim.keymap.set("n", "|", "<Plug>(fern-action-open:rightest)", { buffer = true }) -- vertical split to the far right
vim.opt_local.number = false                                                     -- no line numbers
vim.opt_local.fillchars = { eob = " " }                                          -- fill chars

-- fern enter, expand, collapse
local function fern_smart_leaf()
    return vim.fn["fern#smart#leaf"](
        "<Plug>(fern-action-open:select)",
        "<Plug>(fern-action-expand)",
        "<Plug>(fern-action-collapse)"
    )
end

-- remap fern smart leaf to enter
vim.keymap.set("n", "<Plug>(fern-smart-leaf)", fern_smart_leaf,
    { buffer = true, expr = true, remap = false })
vim.keymap.set("n", "<CR>", "<Plug>(fern-smart-leaf)", { buffer = true, nowait = true })

-- hide dirs/files
local hide_dirs = "^\\%(\\.git\\|node_modules\\)$"
local hide_files = "\\%(\\.DS_Store\\)\\+"
vim.g["fern#default_exclude"] = hide_dirs .. "\\|" .. hide_files

vim.g["fern#default_hidden"] = 1

-- local winhighlight, color of fern buffer
vim.opt_local.winhighlight = "Normal:FernNormal"
