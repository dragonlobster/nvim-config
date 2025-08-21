return {
    "otavioschwanck/arrow.nvim",
    opts = {
        show_icons = false,
        leader_key = ",m", -- Recommended to be a single key
        custom_actions = {
            open = function(target_file_name, _)
                vim.fn["fern#internal#buffer#open"](target_file_name, { opener = "select" })
            end
        }
    }
}
