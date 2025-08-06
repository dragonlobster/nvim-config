return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "html", "javascript", "python", "typescript", "yaml", "dockerfile", "go", "sql" },
            highlight = {
                enable = true
            }
		})
	end
}
