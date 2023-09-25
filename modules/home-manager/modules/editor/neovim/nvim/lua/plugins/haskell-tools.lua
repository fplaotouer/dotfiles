return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { { "mrcjkb/haskell-tools.nvim" } },
		opts = {
			servers = { hls = { mason = false } },
			setup = {
				hls = function(_, _)
					return true
				end,
			},
		},
	},
}
