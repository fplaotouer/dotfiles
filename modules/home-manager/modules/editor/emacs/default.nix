{
  lib,
  config,
  pkgs,
  ...
}: {
  xdg.configFile."emacs" = {
    source = ./emacs;
    recursive = true;
  };
  programs.emacs = {
    package = pkgs.emacs;
    extraConfig = builtins.readFile ./default.el;
    extraPackages = epkgs:
      builtins.attrValues {
        inherit
          (epkgs)
          use-package # use-package
          diminish
          delight
          bind-key
          lsp-mode # LSP and DAP support
          lsp-ui
          dap-mode
          evil # Vim key bindings
          goto-chg
          evil-collection
          evil-nerd-commenter
          company # Completion
          company-quickhelp
          company-box
          yasnippet # Snippet
          yasnippet-snippets
          flycheck # Syntax checking
          flycheck-inline
          flycheck-haskell
          flycheck-rust
          flycheck-hledger
          ivy
          ivy-rich
          ivy-prescient
          lsp-ivy
          counsel
          prescient
          sideline # Sideline
          sideline-flycheck
          projectile # Project interaction
          counsel-projectile
          dirvish # polished Dired
          gruvbox-theme # Utilities
          no-littering
          which-key
          helpful
          magit
          hydra
          all-the-icons
          command-log-mode
          rainbow-delimiters
          haskell-mode # Languages support
          lsp-haskell
          nix-haskell-mode
          rust-mode
          rustic
          cargo
          go-mode
          hledger-mode
          nix-mode
          lua-mode
          ;
      };
    overrides = self: super: {};
  };
}
