return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"simrat39/rust-tools.nvim",
			init = function()
				require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          local rt = require("rust-tools")
					vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = buffer })
					vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = buffer })
				end)
			end,
		},
		opts = {
			setup = {
				rust_analyzer = function(_, opts)
					require("rust-tools").setup({ server = opts })
					return true
				end,
			},
			servers = {
				rust_analyzer = {},
			},
		},
	},
	{
		"saecki/crates.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({
				null_ls = {
					enabled = true,
					name = "Crates",
				},
			})
		end,
	},
}
