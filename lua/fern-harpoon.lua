local Path = require("plenary.path")
local harpoon = require("harpoon")

-- fern get_path, is_dir
--vim.cmd("source " .. nvimrc .. "/vim/fern.vim")

local M = {}

function M.normalize_path(buf_name, root)
    return Path:new(buf_name):make_relative(root)
end

function M.harpoon_add()
    if vim.bo.filetype == "fern" then
        local isdir = vim.fn["fern#is_dir"]()
        if isdir == 1 then
            vim.notify("Harpoon: Can't add directory", vim.log.levels.ERROR)
            return
        end

        local path = vim.fn["fern#get_path"]()

        local rpath = M.normalize_path(
            path,
            vim.loop.cwd()
        )

        local item = {
            value = rpath,
            context = {
                row = 1,
                col = 0,
            },
        }
        harpoon:list():add(item)
        vim.notify(string.format("Harpoon: Added %s to list", rpath), vim.log.levels.INFO)
    else
        harpoon:list():add()
        vim.notify(string.format("Harpoon: Added %s to list", vim.api.nvim_buf_get_name(0)), vim.log.levels.INFO)
    end
end

function M.harpoon_menu()
    -- comment if want to use harpoon menu in fern
    if vim.bo.filetype == "fern" then
        vim.notify("Harpoon: Can't open menu in fern buffer", vim.log.levels.ERROR)
        return
    end
    -- comment if want to use harpoon menu in fern
    harpoon.ui:toggle_quick_menu(harpoon:list())
end

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

-- how to customize select function in harpoon when opened in fern
--[[
local is_fern = false
harpoon:extend({
    UI_CREATE = function(cx)
        is_fern = string.starts(cx.current_file, "fern://")
        if is_fern then

            vim.keymap.set("n", "<CR>", function()
                harpoon.ui:select_menu_item()
            end, { buffer = cx.bufnr, remap = true })
        end
    end,
    SELECT = function(cx)
        if is_fern then
            print(dump(cx.item))
        end
    end
})--]]

return M
