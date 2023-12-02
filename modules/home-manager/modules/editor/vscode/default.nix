{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    userSettings = {
      "update.mode" = "manual";
      "extensions.autoUpdate" = false;
      "editor.fontSize" = 16;
      "editor.formatOnSave" = true;
      "editor.fontFamily" = "'Iosevka Nerd Font', Menlo, Monaco, 'Courier New', monospace";
      "debug.console.fontFamily" = "IosevkaTerm Nerd Font";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.startupEditor" = "none";
      "workbench.colorTheme" = "Gruvbox Material Dark";
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
      # vscode-neovim requirements
      "vscode-neovim.neovimClean" = true;
      "vscode-neovim.neovimExecutablePaths.darwin" = "nvim";
      # Gruvbox
      "gruvboxMaterial.darkContrast" = "medium";
      "gruvboxMaterial.darkPalette" = "mix";
      "gruvboxMaterial.highContrast" = true;
      # manage Haskell toolchains manually
      "haskell.manageHLS" = "PATH";
      # vscode-lldb
      "lldb.suppressUpdateNotifications" = true;
      # Nix LSP
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.formatterPath" = "alejandra";
      # Deno
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "denoland.vscode-deno";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "denoland.vscode-deno";
      };
      "[javascriptreact]" = {
        "editor.defaultFormatter" = "denoland.vscode-deno";
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "denoland.vscode-deno";
      };
      # Redhat
      "redhat.telemetry.enabled" = false;
    };
    extensions = with pkgs.vscode-extensions;
      [
        # NeoVIM Keybindings
        asvetliakov.vscode-neovim
        # Haskell Pack
        haskell.haskell
        justusadam.language-haskell
        # Rust Pack
        matklad.rust-analyzer
        tamasfe.even-better-toml
        serayuzgur.crates
        # Nix Pack
        jnoortheen.nix-ide
        # Bash
        mads-hartmann.bash-ide-vscode
        # Deno
        denoland.vscode-deno
        # Lua
        sumneko.lua
        # Yaml
        redhat.vscode-yaml
        # XML
        redhat.vscode-xml
        # Misc.
        mkhl.direnv
        eamodio.gitlens
        pkief.material-icon-theme
        christian-kohler.path-intellisense
        ms-vscode-remote.remote-ssh
        ibm.output-colorizer
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "gruvbox-material";
          publisher = "sainnhe";
          version = "6.5.2";
          sha256 = "sha256-D+SZEQQwjZeuyENOYBJGn8tqS3cJiWbEkmEqhNRY/i4=";
        }
      ];
  };
}
