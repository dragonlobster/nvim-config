return {
	"folke/which-key.nvim", 
	event = "VeryLazy",
	opts = {
		plugins = {
			presets = {
				operations = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false, 
				g = false
			}
		}
	}
}
