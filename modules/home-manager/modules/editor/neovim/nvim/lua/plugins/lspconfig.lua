return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				rust_analyzer = { mason = false },
				taplo = { mason = false },
				zls = { mason = false },
				lua_ls = { mason = false },
				gopls = { mason = false },
				bashls = {},
				nil_ls = {
					mason = false,
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
