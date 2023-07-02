return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"mrcjkb/haskell-tools.nvim",
				init = function()
					require("lazyvim.util").on_attach(function(_, bufnr)
						local ht = require("haskell-tools")
						local opts = { noremap = true, silent = true, buffer = bufnr }
						-- haskell-language-server relies heavily on codeLenses,
						-- so auto-refresh (see advanced configuration) is enabled by default
						vim.keymap.set("n", "<space>ca", vim.lsp.codelens.run, opts)
						vim.keymap.set("n", "<space>hs", ht.hoogle.hoogle_signature, opts)
						vim.keymap.set("n", "<space>ea", ht.lsp.buf_eval_all, opts)
					end)
				end,
			},
			"nvim-lua/lsp-status.nvim",
		},
		opts = {
			setup = {
				hls = function(_, opts)
					require("haskell-tools").setup({ server = opts })
					return true
				end,
			},
			servers = {
				hls = {},
			},
		},
	},
}
