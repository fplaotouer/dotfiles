-- options

local options = {
    termguicolors = true, -- set term gui colors (most terminals support this)
    background = "dark", -- set background
    fileencoding = "utf-8", -- the encoding written to a file
    colorcolumn = "120",
    list = true,
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    mouse = "a", -- allow the mouse to be used in neovim
    ttyfast = true,
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 2, -- set number column width to 2 {default 4}
    cursorline = true, -- highlight the current line
    autoindent = true,
    cindent = true,
    smartindent = true, -- make indenting smarter again
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    tabstop = 2, -- insert 2 spaces for a tab
    hlsearch = true, -- highlight all matches on previous search pattern
    incsearch = true,
    ignorecase = true, -- ignore case in search patterns
    smartcase = true, -- smart case
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    updatetime = 300, -- faster completion (4000ms default)
    showtabline = 1, -- only if there are at least two tab pages
    pumheight = 10, -- pop up menu height
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    backup = false, -- creates a backup file
    swapfile = false, -- creates a swapfile
    undofile = false, -- enable persistent undo
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    scrolloff = 3,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
