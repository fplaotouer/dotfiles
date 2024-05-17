return {
	{
		"mrcjkb/haskell-tools.nvim",
		opts = {
			hls = {
				default_settings = {
					haskell = {
						formattingProvider = "stylish-haskell",
					},
				},
			},
		},
		config = function(_, opts)
			local ok, telescope = pcall(require, "telescope")
			if ok then
				telescope.load_extension("ht")
			end
			vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.haskell_tools or {}, opts or {})
		end,
	},
}
