return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { { "mrcjkb/haskell-tools.nvim" } },
		opts = {
			servers = {
				hls = { mason = false },
			},
			setup = {
				hls = function(_, opts)
					-- local haskell_tools_opts = require("lazyvim.util").opts("haskell-tools.nvim")
					-- require("haskell-tools").setup(
					-- 	vim.tbl_deep_extend("force", haskell_tools_opts or {}, { server = opts })
					-- )
					return true
				end,
			},
		},
	},
}
