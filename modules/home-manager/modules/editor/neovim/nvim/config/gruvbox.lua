require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = false,   -- invert background for search, diffs, statuslines and errors
  contrast = "",     -- can be "hard", "soft" or empty string
  dim_inactive = true,
  transparent_mode = false,
  palette_overrides = {},
  overrides = {},
})
vim.cmd('colorscheme gruvbox')
