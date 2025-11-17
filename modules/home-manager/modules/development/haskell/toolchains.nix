{pkgs, ...}: let
  ghcVersion = "98";
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
          cabal-gild
          fast-tags
          hlint
        ]
    );
in {
  home.packages = [
    ghcWithPkgs
    hls
  ];
}
