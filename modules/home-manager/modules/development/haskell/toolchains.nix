{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.toolchains.haskell;
  ghcVersion = "94";
  hls = pkgs.haskell-language-server.override {
    dynamic = true;
    supportedGhcVersions = [ghcVersion];
  };
  ghcWithPkgs =
    pkgs.haskell.packages."ghc${ghcVersion}".ghcWithPackages
    (haskellPackages:
      with haskellPackages; [
        # toolchains
        cabal-install
        hoogle
        # tools
        cabal2nix
        stylish-haskell
        haskell-dap
        ghci-dap
        haskell-debug-adapter
        cabal-fmt
        fast-tags
        hlint
      ]);
in {
  options.toolchains.haskell = {
    enable = lib.mkEnableOption "An advanced, purely functional programming language";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [
      ghcWithPkgs
      hls
    ];
  };
}
