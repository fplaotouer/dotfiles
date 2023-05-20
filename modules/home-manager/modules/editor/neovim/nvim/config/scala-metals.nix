{pkgs}: ''
  local metals = require("metals")
  local metals_config = require("metals").bare_config()

  local lsp_status = require('lsp-status')
  lsp_status.register_progress()

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)
  local def_opts = { noremap = true, silent = true, }
  local lsp_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")

    local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })

    vim.keymap.set("n", "<leader>ws", metals.hover_worksheet, opts)

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, def_opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, def_opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, def_opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<C-l>', function() vim.lsp.buf.format { async = true } end, opts)

    lsp_status.on_attach(client)
  end


  metals_config.on_attach = lsp_attach
  metals_config.capabilities = capabilities
  metals_config.init_options.statusBarProvider = "on"
  metals_config.settings = {
    showImplicitArguments = true,
    metalsBinaryPath = "${pkgs.metals}/bin/metals"
  }


  -- Autocmd that will actually be in charging of starting the whole thing
  local nvim_metals_group = vim.api.nvim_create_augroup("_nvim-metals", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
  })
''
