return {
	{ import = "plugins" },
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	{
		"mrcjkb/haskell-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
	},
	{
		{ "simrat39/rust-tools.nvim", dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } },
		{ "saecki/crates.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	-- LazyVim Configuations
	{
		-- Override defaults
		{
			"nvim-treesitter/nvim-treesitter",
			dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
			opts = { ensure_installed = "all", context_commentstring = { enable = true, enable_autocmd = false } },
		},
		-- Extra LazyVim plugins
		{ import = "lazyvim.plugins.extras.ui.edgy" },
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.dap.nlua" },
		{ import = "lazyvim.plugins.extras.test.core" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "lazyvim.plugins.extras.lang.python-semshi" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.yaml" },
		-- Disabled LazyVim plugins
		{ "williamboman/mason.nvim", enabled = false },
		{ "williamboman/mason-lspconfig.nvim", enabled = false },
		{ "jay-babu/mason-nvim-dap.nvim", enabled = false },
		{ "echasnovski/mini.comment", enabled = false },
		{ "mfussenegger/nvim-dap-python", enabled = false },
	},
}
