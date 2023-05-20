local indent_blankline = require("indent_blankline")

indent_blankline.setup {
    space_char_blankline = " ",
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble" },
    show_current_context = true,
    show_current_context_start = true,
}
