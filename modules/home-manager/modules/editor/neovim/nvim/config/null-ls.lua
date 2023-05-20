local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.cabal_fmt,
    null_ls.builtins.formatting.alejandra,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.black,
  },
})

