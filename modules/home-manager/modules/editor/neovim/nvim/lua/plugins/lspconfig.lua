return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				hls = function()
					return true
				end,
				rust_analyzer = function()
					return true
				end,
			},
			servers = {
				zls = { mason = false },
				hls = { mason = false },
				bashls = {},
				nil_ls = {
					settings = {
						["nil"] = {
							formatting = {
								command = { "alejandra" },
							},
						},
					},
				},
			},
		},
	},
}
