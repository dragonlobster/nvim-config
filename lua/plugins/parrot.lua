-- only activate parrot if you have api key
return {
    "frankroeder/parrot.nvim",

    cond = function() return os.getenv("OPENROUTER_API_KEY") end,

    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },

    opts = {
        -- Providers must be explicitly set up to make them available.
        providers = {
            openrouter = {
                name = "openrouter",
                style = "openai",
                api_key = os.getenv("OPENROUTER_API_KEY"),
                endpoint = "https://openrouter.ai/api/v1/chat/completions",
                models = { "anthropic/claude-3.5-sonnet" },
                topic = {
                    model = "anthropic/claude-3.5-sonnet",
                    params = { max_completion_tokens = 64 },
                },
                params = {
                    chat = { temperature = 1.1, top_p = 1 },
                    command = { temperature = 1.1, top_p = 1 },
                },
            }
        },

        toggle_target = "popup",
        chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<CR>" }
    },
    -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
}
