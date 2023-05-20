-- keymaps

local keymap_opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", keymap_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", keymap_opts)
keymap("n", "<C-j>", "<C-w>j", keymap_opts)
keymap("n", "<C-k>", "<C-w>k", keymap_opts)
keymap("n", "<C-l>", "<C-w>l", keymap_opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", keymap_opts)
keymap("n", "<C-Down>", ":resize +2<CR>", keymap_opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", keymap_opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", keymap_opts)

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
keymap("n", "<S-l>", ":bnext<CR>", keymap_opts)
keymap("n", "<S-h>", ":bprevious<CR>", keymap_opts)
keymap("n", "<Leader>bd", ":Bdelete<CR>", keymap_opts)
keymap("n", "<Leader><Leader>", "<C-^>", keymap_opts)
