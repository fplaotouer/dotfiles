{
  lib,
  config,
  pkgs,
  ...
}: {
  home = {
    sessionVariables = {
      CABAL_DIR = "${config.xdg.dataHome}/cabal";
      STACK_ROOT = "${config.xdg.dataHome}/stack";
      GHCUP_USE_XDG_DIRS = "WHY_NOT";
    };
    sessionPath = [
      "${config.xdg.dataHome}/cabal/bin"
      # when `GHCUP_USE_XDG_DIRS` is set, GHCup installs binaries to `XDG_BIN_HOME` (usually $HOME/.local/bin, use directly since `binHome` is not defined in `config.xdg` yet),
      # and GHCup makes some assumptions about structure of files in `XDG_BIN_HOME`, details refer to [GHCup XDG support](https://www.haskell.org/ghcup/guide/#xdg-support)
      "$HOME/.local/bin"
    ];
    packages = builtins.attrValues {
      inherit
        (pkgs.haskellPackages)
        stylish-haskell
        cabal-fmt
        ;
    };
  };
}
