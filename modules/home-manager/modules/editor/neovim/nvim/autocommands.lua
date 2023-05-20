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

local format_on_save = vim.api.nvim_create_augroup("_format_on_save", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  callback = function()
    vim.lsp.buf.format { sync = true }
  end,
  group = format_on_save,
})
