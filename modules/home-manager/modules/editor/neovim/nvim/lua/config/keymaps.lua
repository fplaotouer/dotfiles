-- keymaps

local keymap_opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Space>", "<Nop>", keymap_opts)
-- No arrow keys --- force yourself to use the home row
vim.keymap.set({ "n", "i" }, "<Up>", "<Nop>", keymap_opts)
vim.keymap.set({ "n", "i" }, "<Down>", "<Nop>", keymap_opts)
vim.keymap.set({ "n", "i" }, "<Left>", "<Nop>", keymap_opts)
vim.keymap.set({ "n", "i" }, "<Right>", "<Nop>", keymap_opts)
-- Buffers Operations
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", keymap_opts)
