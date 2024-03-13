return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				hls = { mason = false },
				rust_analyzer = { mason = false },
				zls = { mason = false },
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
