local cn = require("catppuccin")

cn.setup({
	flavour = "macchiato",
	integrations = {
		fern = true,
		which_key = true,
		telescope = {
			enabled = true,
		}
	}
})

vim.cmd.colorscheme "catppuccin"
