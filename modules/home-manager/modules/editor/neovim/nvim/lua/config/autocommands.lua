-- autocommands

local git_spell_and_wrap = vim.api.nvim_create_augroup("_git_spell_and_wrap", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
	end,
	group = git_spell_and_wrap,
})

local markdown_spell_and_wrap = vim.api.nvim_create_augroup("_markdown_spell_and_wrap", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
	end,
	group = markdown_spell_and_wrap,
})
