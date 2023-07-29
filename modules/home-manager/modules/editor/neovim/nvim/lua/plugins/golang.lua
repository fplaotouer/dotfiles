return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"ray-x/go.nvim",
			"ray-x/guihua.lua",
		},
		opts = {
			setup = {
				gopls = function(_, opts)
					require("go").setup({ lsp_cfg = opts })
					return true
				end,
			},
			servers = {
				gopls = {},
			},
		},
	},
}
