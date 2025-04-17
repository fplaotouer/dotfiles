{
  lib,
  config,
  pkgs,
  ...
}: let
  ghcVersion = "96";
  hls = pkgs.haskell-language-server.override {
    dynamic = true;
    supportedGhcVersions = [ghcVersion];
  };
  ghcWithPkgs =
    pkgs.haskell.packages."ghc${ghcVersion}".ghcWithPackages
    (
      haskellPackages:
        with haskellPackages; [
          # toolchains
          cabal-install
          hoogle
          # tools
          cabal2nix
          cabal-gild
          stylish-haskell
          fast-tags
          hlint
        ]
    );
in {
  environment = {
    pathsToLink = [
      "/share/zsh"
      "/share/bash-completion"
      "/share/qemu"
      "/share/xdg-desktop-portal"
      "/share/applications"
    ];
    systemPackages = builtins.attrValues {
      inherit ghcWithPkgs hls;
      inherit (pkgs) zig zls;
      inherit
        (pkgs)
        qemu
        tcpdump
        ;
    };
  };
}
