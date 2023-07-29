{
  lib,
  config,
  pkgs,
  ...
}: let
  fixCyclicReference = drv:
    pkgs.haskell.lib.compose.overrideCabal (_: {enableSeparateBinOutput = false;}) drv;
  cfg = config.toolchains.haskell;
  ghcVersion = "94";
  hls = pkgs.haskell-language-server.override {
    dynamic = true;
    supportedGhcVersions = [ghcVersion];
  };
  ghcWithPkgs =
    pkgs.haskell.packages."ghc${ghcVersion}".ghcWithPackages
    (
      haskellPackages:
        with haskellPackages;
          [
            # toolchains
            cabal-install
            hoogle
            # tools
            cabal2nix
            stylish-haskell
            haskell-dap
            ghci-dap
            haskell-debug-adapter
            fast-tags
            hlint
          ]
          # Workaround
          ++ map fixCyclicReference [
            cabal-fmt
          ]
    );
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
