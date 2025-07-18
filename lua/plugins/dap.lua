return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            -- C++
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                    args = { "--port", "${port}" },
                    detached = function() if vim.fn.has("win32") == 1 then return false else return true end end,
                }
            }
            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "codelldb",
                    request = "launch",
                    program = function() -- Ask the user what executable wants to debug
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/bin", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }
        end

    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", },
        config = function()
            local dapui = require("dapui")
            dapui.setup()
        end
    },
    {
        "theHamsta/nvim-dap-virtual-text",
    }
}
