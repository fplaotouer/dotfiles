return {
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = vim.list_extend(opts.sources, {
				nls.builtins.formatting.cabal_fmt,
				nls.builtins.formatting.alejandra,
				nls.builtins.formatting.shfmt,
				nls.builtins.formatting.fish_indent,
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.ruff,

				nls.builtins.diagnostics.shellcheck,
				nls.builtins.diagnostics.fish,
				nls.builtins.diagnostics.ruff,
			})
		end,
	},
}
