return {
	{
		"neovim/nvim-lspconfig",
		opts = {
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
