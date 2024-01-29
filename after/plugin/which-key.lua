local wk = require("which-key")

wk.register({ 
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>confirm q<CR>", "Quit" },
	["e"] = { "<cmd>Fern . -width=20 -drawer -stay -toggle<CR>", "Explorer" }
}, { prefix = "<leader>" })
