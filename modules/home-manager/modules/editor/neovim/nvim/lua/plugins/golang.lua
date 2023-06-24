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
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-go",
		},
		opts = {
			adapters = {
				["neotest-go"] = {
					-- Here we can set options for neotest-go, e.g.
					-- args = { "-tags=integration" }
				},
			},
		},
	},
}
