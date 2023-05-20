local ht = require('haskell-tools')

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

  vim.keymap.set('n', '<Leader>ca', vim.lsp.codelens.run, opts)
  vim.keymap.set('n', '<Leader>hs', ht.hoogle.hoogle_signature, opts)
  vim.keymap.set('n', '<Leader>ea', ht.lsp.buf_eval_all, opts)

  -- nvim-lsp recommanded keymaps
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, def_opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, def_opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, def_opts)
  vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<C-l>', function() vim.lsp.buf.format { async = true } end, opts)

  lsp_status.on_attach(client)
end

ht.start_or_attach {
  tools = {
    codeLens = {
      -- Whether to automatically display/refresh codeLenses
      -- (explicitly set to false to disable)
      autoRefresh = true,
    },
    hoogle = {
      -- 'auto': Choose a mode automatically, based on what is available.
      -- 'telescope-local': Force use of a local installation.
      -- 'telescope-web': The online version (depends on curl).
      -- 'browser': Open hoogle search in the default browser.
      mode = 'auto',
    },
    hover = {
      -- Whether to disable haskell-tools hover and use the builtin lsp's default handler
      disable = false,
      -- Set to nil to disable
      border = {
        { '╭', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╮', 'FloatBorder' },
        { '│', 'FloatBorder' },
        { '╯', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '╰', 'FloatBorder' },
        { '│', 'FloatBorder' },
      },
      -- Stylize markdown (the builtin lsp's default behaviour).
      -- Setting this option to false sets the file type to markdown and enables
      -- Treesitter syntax highligting for Haskell snippets if nvim-treesitter is installed
      stylize_markdown = false,
      -- Whether to automatically switch to the hover window
      auto_focus = false,
    },
    definition = {
      -- Configure vim.lsp.definition to fall back to hoogle search
      -- (does not affect vim.lsp.tagfunc)
      hoogle_signature_fallback = false,
    },
    repl = {
      -- 'builtin': Use the simple builtin repl
      -- 'toggleterm': Use akinsho/toggleterm.nvim
      handler = 'builtin',
      builtin = {
        create_repl_window = function(view)
          -- create_repl_split | create_repl_vsplit | create_repl_tabnew | create_repl_cur_win
          return view.create_repl_split { size = vim.o.lines / 3 }
        end
      },
      -- Can be overriden to either `true` or `false`. The default behaviour depends on the handler.
      auto_focus = nil,
    },
    -- Set up autocmds to generate tags (using fast-tags)
    -- e.g. so that `vim.lsp.tagfunc` can fall back to Haskell tags
    tags = {
      enable = vim.fn.executable('fast-tags') == 1,
      -- Events to trigger package tag generation
      package_events = { 'BufWritePost' },
    },
  },
  hls = {
    -- LSP client options
    on_attach = lsp_attach,
    capabilities = capabilities,
    settings = function(project_root)
      return ht.lsp.load_hls_settings(project_root)
    end,
    default_settings = {
      haskell = {
        -- The formatting providers.
        formattingProvider = 'fourmolu',
        cabalFormattingProvider = 'cabalfmt',
        maxCompletions = 40,
        checkProject = true,
        checkParents = 'CheckOnSave',
        plugin = {
          alternateNumberFormat = { globalOn = true },
          callHierarchy = { globalOn = true },
          changeTypeSignature = { globalOn = true },
          class = {
            codeActionsOn = true,
            codeLensOn = true,
          },
          eval = {
            globalOn = true,
            config = {
              diff = true,
              exception = true,
            },
          },
          excplicitFixity = { globalOn = true },
          gadt = { globalOn = true },
              ['ghcide-code-actions-bindings'] = { globalOn = true },
              ['ghcide-code-actions-fill-holes'] = { globalOn = true },
              ['ghcide-code-actions-imports-exports'] = { globalOn = true },
              ['ghcide-code-actions-type-signatures'] = { globalOn = true },
              ['ghcide-completions'] = {
            globalOn = true,
            config = {
              autoExtendOn = true,
              snippetsOn = true,
            },
          },
              ['ghcide-hover-and-symbols'] = {
            hoverOn = true,
            symbolsOn = true,
          },
              ['ghcide-type-lenses'] = {
            globalOn = true,
            config = {
              mode = 'always',
            },
          },
          haddockComments = { globalOn = true },
          hlint = {
            codeActionsOn = true,
            diagnosticsOn = true,
          },
          importLens = {
            globalOn = true,
            codeActionsOn = true,
            codeLensOn = true,
          },
          moduleName = { globalOn = true },
          pragmas = {
            codeActionsOn = true,
            completionOn = true,
          },
          qualifyImportedNames = { globalOn = true },
          refineImports = {
            codeActionsOn = true,
            codeLensOn = true,
          },
          rename = {
            globalOn = true,
            config = { crossModule = true },
          },
          retrie = { globalOn = true },
          splice = { globalOn = true },
          tactics = {
            codeActionsOn = true,
            codeLensOn = true,
            config = {
              auto_gas = 4,
              hole_severity = nil,
              max_use_ctor_actions = 5,
              proofstate_styling = true,
              timeout_duration = 2,
            },
            hoverOn = true,
          },
        },
      }
    }
  }
}

-- Suggested keymaps that do not depend on haskell-language-server:
local bufnr = vim.api.nvim_get_current_buf()
-- set buffer = bufnr in ftplugin/haskell.lua
local opts = { noremap = true, silent = true, buffer = bufnr }

-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, def_opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
