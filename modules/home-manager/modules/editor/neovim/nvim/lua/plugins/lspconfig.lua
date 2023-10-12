return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
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
