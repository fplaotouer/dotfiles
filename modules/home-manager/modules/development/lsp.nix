{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      marksman
      shellcheck
      sumneko-lua-language-server
      nil
      ;
    inherit
      (pkgs.nodePackages)
      yaml-language-server
      bash-language-server
      ;
  };
}
