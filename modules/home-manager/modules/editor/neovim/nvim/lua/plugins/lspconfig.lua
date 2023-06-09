return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
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
				pyright = {},
				ansiblels = {
					settings = {
						ansible = {
							ansible = {
								path = "ansible",
							},
							executionEnvironment = {
								enabled = false,
							},
							python = {
								interpreterPath = "python3",
							},
							validation = {
								enabled = true,
								lint = {
									enabled = true,
									path = "ansible-lint",
								},
							},
						},
					},
				},
				marksman = {},
				yamlls = {},
			},
		},
	},
}
