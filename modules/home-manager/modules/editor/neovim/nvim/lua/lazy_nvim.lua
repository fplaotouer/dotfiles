return {
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	{
		"mrcjkb/haskell-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
	},
	-- LazyVim Configuations
	{
		-- Extra LazyVim plugins
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.dap.nlua" },
		{ import = "lazyvim.plugins.extras.test.core" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.clangd" },
		{ import = "lazyvim.plugins.extras.lang.cmake" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "lazyvim.plugins.extras.lang.python-semshi" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.yaml" },
		{ import = "lazyvim.plugins.extras.util.project" },
		{ import = "lazyvim.plugins.extras.ui.edgy" },
		-- Disabled LazyVim plugins
		{ "echasnovski/mini.comment", enabled = false },
		-- Override defaults
		{ "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = "all" } },
		{ "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
	},
	-- import/override with your plugins
	{ import = "plugins" },
}
