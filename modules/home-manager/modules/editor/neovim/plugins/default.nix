{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = let
    inherit (builtins) readDir attrNames filter map;
    paths = attrNames (readDir ./.);
    modules = filter (name: name != "default.nix") paths;
  in
    map (name: ./. + "/${name}") modules;

  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Utils
    plenary-nvim
    popup-nvim
    nui-nvim
    nvim-web-devicons
    which-key-nvim
    {
      plugin = impatient-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/impatient.lua;
    }
    # Treesitter
    nvim-treesitter-refactor
    nvim-treesitter-textobjects
    nvim-treesitter-context
    nvim-ts-autotag
    nvim-ts-context-commentstring
    nvim-ts-rainbow
    {
      plugin = nvim-treesitter.withAllGrammars;
      type = "lua";
      config = builtins.readFile ./../nvim/config/treesitter.lua;
    }
    # Debugging Support
    nvim-dap
    nvim-dap-virtual-text
    neodev-nvim
    {
      plugin = nvim-dap-ui;
      type = "lua";
      config = builtins.readFile ./../nvim/config/dapui.lua;
    }
    # Specific Language Support
    {
      plugin = haskell-tools-nvim;
      runtime."ftplugin/haskell.lua".source = ./../nvim/ftplugin/haskell.lua;
    }
    {
      plugin = rust-tools-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/rust-tools.lua;
    }
    {
      plugin = crates-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/crates.lua;
    }
    guihua-lua
    {
      plugin = go-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/go-nvim.lua;
    }
    # {
    #   plugin = nvim-metals;
    #   type = "lua";
    #   config = (import ../nvim/config/scala-metals.nix {
    #     inherit pkgs;
    #   });
    # }
    # LSP config
    lsp-status-nvim
    cmp-nvim-lsp
    nvim-navic
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = builtins.readFile ./../nvim/config/nvim-lsp.lua;
    }
    {
      plugin = null-ls-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/null-ls.lua;
    }
    # Autocompletion & snippet
    luasnip
    cmp_luasnip
    cmp-path
    cmp-buffer
    cmp-cmdline
    {
      plugin = nvim-cmp;
      type = "lua";
      config = builtins.readFile ./../nvim/config/nvim-cmp.lua;
    }
    # Diagnostics
    {
      plugin = trouble-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/trouble.lua;
    }
    # Statusline
    {
      plugin = lualine-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/lualine.lua;
    }
    # Buffer line
    bufdelete-nvim
    {
      plugin = bufferline-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/bufferline.lua;
    }
    # Git integration
    {
      plugin = gitsigns-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/gitsigns.lua;
    }
    # Better UI
    {
      plugin = noice-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/noice.lua;
    }
    {
      plugin = nvim-notify;
      type = "lua";
      config = builtins.readFile ./../nvim/config/notify.lua;
    }
    {
      plugin = dressing-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/dressing.lua;
    }
    # Indent line
    {
      plugin = indent-blankline-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/indent-blankline.lua;
    }
    # Auto pairs
    {
      plugin = nvim-autopairs;
      type = "lua";
      config = builtins.readFile ./../nvim/config/autopairs.lua;
    }
    # Comments
    {
      plugin = comment-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/comment.lua;
    }
    {
      plugin = todo-comments-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/todo-comments.lua;
    }
    # Note taking
    {
      plugin = zen-mode-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/zen-mode-nvim.lua;
    }
    # Surround selections
    nvim-surround
    # Colorschemes
    {
      plugin = gruvbox-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/gruvbox.lua;
    }
    # Telescope
    telescope_hoogle
    {
      plugin = telescope-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/telescope.lua;
    }
    # Terminal
    {
      plugin = toggleterm-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/toggleterm.lua;
    }
    # File Explorer
    {
      plugin = neo-tree-nvim;
      type = "lua";
      config = builtins.readFile ./../nvim/config/neo-tree.lua;
    }
  ];
}
