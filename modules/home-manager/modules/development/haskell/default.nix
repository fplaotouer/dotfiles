{config, ...}: {
  home = {
    sessionVariables = {
      CABAL_DIR = "${config.xdg.dataHome}/cabal";
      STACK_ROOT = "${config.xdg.dataHome}/stack";
      GHCUP_INSTALL_BASE_PREFIX = "${config.xdg.dataHome}/ghcup";
    };
    sessionPath = [
      "${config.xdg.dataHome}/cabal/bin"
      "${config.xdg.dataHome}/ghcup/.ghcup/bin"
    ];
  };
}
