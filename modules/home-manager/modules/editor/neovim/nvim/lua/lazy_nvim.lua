return {
	{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
	-- LazyVim Configuations
	{
		-- Extra LazyVim plugins
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.test.core" },
		{ import = "lazyvim.plugins.extras.ui.edgy" },
		{ import = "lazyvim.plugins.extras.lang.haskell" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.clangd" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.yaml" },
		{ import = "lazyvim.plugins.extras.util.project" },
		-- Override defaults
		{ "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = "all" } },
	},
	-- import/override with your plugins
	{ import = "plugins" },
}
