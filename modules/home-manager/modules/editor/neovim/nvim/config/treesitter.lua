local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})
