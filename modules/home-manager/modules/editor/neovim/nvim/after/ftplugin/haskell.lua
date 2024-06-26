-- ~/.config/nvim/after/ftplugin/haskell.lua
local ht = require("haskell-tools")
local bufnr = vim.api.nvim_get_current_buf()

-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set(
	"n",
	"<leader>hs",
	ht.hoogle.hoogle_signature,
	{ desc = "Hoogle Signature", noremap = true, silent = true, buffer = bufnr }
)
-- Toggle a GHCi repl for the current package
vim.keymap.set(
	"n",
	"<leader>rr",
	ht.repl.toggle,
	{ desc = "GHCi repl for the current package", noremap = true, silent = true, buffer = bufnr }
)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set("n", "<leader>rf", function()
	ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, { desc = "GHCi repl for the current buffer", noremap = true, silent = true, buffer = bufnr })
-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set(
	"n",
	"<leader>rq",
	ht.repl.quit,
	{ desc = "Quit GHCi repl", noremap = true, silent = true, buffer = bufnr }
)
