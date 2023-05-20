-- Set up Neovim native LSP.
local nvim_lsp = require("lspconfig")
local navic = require("nvim-navic")
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local servers = { "denols", "marksman", "yamlls", "bashls" }
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local def_opts = { noremap = true, silent = true, }
local lsp_attach = function(client, bufnr)
  local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option("formatexpr", "v:lua.vim.lsp.formatexpr()")
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  buf_set_option("tagfunc", "v:lua.vim.lsp.tagfunc")
  -- ========================================================================

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, def_opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, def_opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, def_opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<C-l>', function() vim.lsp.buf.format { async = true } end, opts)

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  lsp_status.on_attach(client)
  require('sqls').on_attach(client, bufnr)
end

nvim_lsp.ansiblels.setup {
  on_attach = lsp_attach,
  capabilities = capabilities,
  settings = {
    ansible = {
      ansible = {
        path = "ansible"
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = "python3"
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint"
        },
      },
    },
  },
}
nvim_lsp.lua_ls.setup {
  on_attach = lsp_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

nvim_lsp.nil_ls.setup {
  on_attach = lsp_attach,
  capabilities = capabilities,
  settings = {
    ['nil'] = {
      formatting = {
        command = { "alejandra" },
      },
    },
  },
}

-- General Language Servers
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = lsp_attach,
    capabilities = capabilities,
  }
end
