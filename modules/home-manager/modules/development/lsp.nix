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
