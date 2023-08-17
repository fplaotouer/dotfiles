return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function()
			local null_ls = require("null-ls")
			return {
				sources = {
					null_ls.builtins.formatting.cabal_fmt,
					null_ls.builtins.formatting.alejandra,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.fish_indent,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.ruff,
					null_ls.builtins.formatting.black,

					null_ls.builtins.diagnostics.shellcheck,
					null_ls.builtins.diagnostics.fish,
					null_ls.builtins.diagnostics.ruff,
				},
			}
		end,
	},
}
