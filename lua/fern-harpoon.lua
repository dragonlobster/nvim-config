local Path = require("plenary.path")
local harpoon = require("harpoon")

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
    if vim.bo.filetype == "fern" then
        vim.notify("Harpoon: Can't open menu in fern buffer", vim.log.levels.ERROR)
        return
    end
    harpoon.ui:toggle_quick_menu(harpoon:list())
end

return M
