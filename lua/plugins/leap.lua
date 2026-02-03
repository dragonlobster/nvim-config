return {
    url = "https://codeberg.org/andyg/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
        -- require("leap").create_default_mappings()

        -- TODO: add group
        vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
        vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')

        -- Highly recommended: define a preview filter to reduce visual noise
        -- and the blinking effect after the first keypress
        -- (see `:h leap.opts.preview`).
        -- For example, skip preview if the first character of the match is
        -- whitespace or is in the middle of an alphabetic word:
        require('leap').opts.preview = function(ch0, ch1, ch2)
            return not (
                ch1:match('%s')
                or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
            )
        end

        -- indicate when leap is active
        vim.api.nvim_create_autocmd("User", {
            pattern = "LeapEnter",
            callback = function()
                vim.notify(vim.fn.nr2char(0x1f998)) -- when leap is active show kangaroo
            end,
        }

        -- indicate when leap is left
        )
        vim.api.nvim_create_autocmd("User", {
            pattern = "LeapLeave",
            callback = function()
                vim.notify(" ") -- clear notification when leap is left
            end,
        }
        )
    end,
    --lazy = false
}
