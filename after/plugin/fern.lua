local ferngroup = vim.api.nvim_create_augroup("fern-custom", { clear = true} )

function init_fern()
	vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = true });
	vim.keymap.set("n", "<C-h>", "<C-w>h", { buffer = true });
	-- fern expand collapse
end

vim.api.nvim_create_autocmd("FileType", 
{ 
	group = ferngroup,
	pattern = { "fern" },
	callback = init_fern,
})
