# Update except NeoVIM nightly overlay
upxnvim:
    nix flake lock \
      --update-input nixpkgs \
      --update-input nixpkgs-stable \
      --update-input home-manager \
      --update-input sops-nix \
      --update-input darwin \
      --update-input flake-utils \
      --update-input guihua-lua-nvim
