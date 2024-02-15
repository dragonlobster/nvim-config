local glyphgroup = vim.api.nvim_create_augroup("glyph-custom", { clear = true} )

function init_glyph_palette()
	return vim.fn["glyph_palette#apply"]()
end

vim.api.nvim_create_autocmd("FileType", 
{ 
	group = glyphgroup,
	pattern = { "fern" },
	callback = init_glyph_palette,
})
