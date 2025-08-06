return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "plenary.nvim" },
    config = function()
        local configs = require("harpoon")
        configs:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true
            },
        })

        configs:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "|", function()
                    configs.ui:select_menu_item({ vsplit = true })
                    -- window equal size
                    vim.cmd("wincmd =")
                end, { buffer = cx.bufnr })
            end,
        })
    end
}
