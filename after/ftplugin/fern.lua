local wk = require("which-key")

vim.fn["glyph_palette#apply"]()

vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = true });                       -- focus to the right
vim.keymap.set("n", "<C-h>", "<C-w>h", { buffer = true });                       -- focus to the left
vim.keymap.set("n", "|", "<Plug>(fern-action-open:rightest)", { buffer = true }) -- vertical split to the far right

vim.opt_local.number = false                                                     -- no line numbers
vim.opt_local.fillchars = { eob = " " }                                          -- fill chars

-- ========== fern enter, expand, collapse ========== --

local function fern_smart_leaf()
    return vim.fn["fern#smart#leaf"](
        "<Plug>(fern-action-open:select)",
        "<Plug>(fern-action-expand)",
        "<Plug>(fern-action-collapse)"
    )
end
vim.keymap.set("n", "<Plug>(fern-smart-leaf)", fern_smart_leaf,
    { buffer = true, expr = true })

-- ========== fern enter, expand, collapse ========== --


-- ========== Fern CD                      ========== --

local function fern_cd()
    return vim.fn["fern#smart#root"](
        "<Plug>(fern-action-leave)<Plug>(fern-wait)<Plug>(fern-action-cd:root)",
        "<Plug>(fern-action-open-or-enter)<Plug>(fern-wait)<Plug>(fern-action-cd:root)"
    )
end
vim.keymap.set("n", "<Plug>(fern-cd)", fern_cd,
    { buffer = true, expr = true })

-- ========== Fern CD                      ========== --


-- ========== fern navigation plug         ========== --

local function fern_navigate()
    return vim.fn["fern#smart#root"](
        "<Plug>(fern-action-leave)<Plug>(fern-wait)<Plug>(fern-action-cd:root)",
        "<Plug>(fern-smart-leaf)"
    )
end
-- remap fern smart root to enter key
vim.keymap.set("n", "<Plug>(fern-navigate)", fern_navigate,
    { buffer = true, expr = true })

-- ========== fern navigation plug         ========== --


-- ========== fern PLUG keymaps            ========== --

vim.keymap.set("n", "<cr>", "<Plug>(fern-navigate)", { buffer = true, nowait = true })

vim.keymap.set("n", "<leader><cr>", "<Plug>(fern-cd)", { desc = "Fern cd: ", buffer = true, nowait = true })

-- ========== fern PLUG keymaps            ========== --


-- local winhighlight, color of fern buffer
vim.opt_local.winhighlight = "Normal:FernNormal"
