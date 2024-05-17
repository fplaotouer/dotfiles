{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      pkg-config
      alejandra
      ;
  };
}
