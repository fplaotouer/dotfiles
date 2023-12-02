return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				cabal = { "cabal-fmt" },
				nix = { "alejandra" },
				lua = { "stylua" },
				fish = { "fish_indent" },
				sh = { "shfmt" },
				python = { "ruff" },
			},
			formatters = {
				injected = { options = { ignore_errors = true } },
			},
		},
	},
}
