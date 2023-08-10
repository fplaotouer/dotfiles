-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ "mrcjkb/haskell-tools.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		{
			{ "simrat39/rust-tools.nvim", dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } },
			{ "saecki/crates.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		{ import = "plugins" },
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
	},
	defaults = {
		lazy = false,
		version = false,
	},
	checker = { enabled = true },
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
