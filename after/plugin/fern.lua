local ferngroup = vim.api.nvim_create_augroup("fern-custom", { clear = true} )

function init_fern()
	vim.keymap.set("n", "<C-l>", "<C-w>l", { buffer = true });
	vim.keymap.set("n", "<C-h>", "<C-w>h", { buffer = true });

	-- fern expand collapse
	local function fern_smart_leaf()
		return vim.fn["fern#smart#leaf"](
			"<Plug>(fern-action-collapse)",
			"<Plug>(fern-action-expand)",
			"<Plug>(fern-action-collapse)"
		)
	end

	vim.keymap.set("n", "<Plug>(fern-my-expand-or-collapse)", fern_smart_leaf, { buffer = true, expr = true, remap = false })
	vim.keymap.set("n", "<CR>", "<Plug>(fern-my-expand-or-collapse)", { buffer = true, nowait = true })
	
end

vim.api.nvim_create_autocmd("FileType", 
{ 
	group = ferngroup,
	pattern = { "fern" },
	callback = init_fern,
})
