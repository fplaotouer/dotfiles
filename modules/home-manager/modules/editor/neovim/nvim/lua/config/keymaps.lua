-- keymaps

local keymap_opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- No arrow keys --- force yourself to use the home row
keymap("n", "<Up>", "<Nop>", keymap_opts)
keymap("n", "<Down>", "<Nop>", keymap_opts)
keymap("n", "<Left>", "<Nop>", keymap_opts)
keymap("n", "<Right>", "<Nop>", keymap_opts)
keymap("i", "<Up>", "<Nop>", keymap_opts)
keymap("i", "<Down>", "<Nop>", keymap_opts)
keymap("i", "<Left>", "<Nop>", keymap_opts)
keymap("i", "<Right>", "<Nop>", keymap_opts)

-- Buffers Operations
keymap("n", "<Leader><Leader>", "<C-^>", keymap_opts)
