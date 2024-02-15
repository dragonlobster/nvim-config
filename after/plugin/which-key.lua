local wk = require("which-key")

wk.register({ 
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>confirm q<CR>", "Quit" },
	["e"] = { "<cmd>Fern . -width=35 -drawer -stay -toggle<CR>", "Explorer" },
	["f"] = { 
		function()
			require("telescope.builtin").find_files()
		end,
		"Find File" 
	},
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	--["c"] { "<cmd>BufferKill<CR>", "Close Buffer" },
	s = {
		name = "Search",
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	},
}, { prefix = "<leader>" })

