return {
    "folke/sidekick.nvim",
    cond = not vim.env.OPENROUTER_API_KEY,
    opts = {
        nes = { enabled = true }
    },
    keys = {
        {
            "<tab>",
            function()
                -- if there is a next edit, jump to it, otherwise apply it if any
                if not require("sidekick").nes_jump_or_apply() then
                    return "<Tab>" -- fallback to normal tab
                end
            end,
            expr = true,
            desc = "Goto/Apply Next Edit Suggestion",
        },
        {
            "<c-.>",
            function() require("sidekick.cli").focus() end,
            desc = "Sidekick Focus",
            mode = { "n", "t", "i", "x" },
        },
        {
            "<leader>za",
            function() require("sidekick.cli").toggle() end,
            desc = "Sidekick Toggle CLI",
        },
        {
            "<leader>zs",
            function() require("sidekick.cli").select() end,
            -- Or to select only installed tools:
            -- require("sidekick.cli").select({ filter = { installed = true } })
            desc = "Select CLI",
        },
        {
            "<leader>zd",
            function() require("sidekick.cli").close() end,
            desc = "Detach a CLI Session",
        },
        {
            "<leader>zt",
            function() require("sidekick.cli").send({ msg = "{this}" }) end,
            mode = { "x", "n" },
            desc = "Send This",
        },
        {
            "<leader>zf",
            function() require("sidekick.cli").send({ msg = "{file}" }) end,
            desc = "Send File",
        },
        {
            "<leader>zv",
            function() require("sidekick.cli").send({ msg = "{selection}" }) end,
            mode = { "x" },
            desc = "Send Visual Selection",
        },
        {
            "<leader>zp",
            function() require("sidekick.cli").prompt() end,
            mode = { "n", "x" },
            desc = "Sidekick Select Prompt",
        },
        -- -- Example of a keybinding to open Claude directly
        -- {
        --     "<leader>zc",
        --     function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
        --     desc = "Sidekick Toggle Claude",
        -- },
    },
}
