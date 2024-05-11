{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      alejandra
      pkg-config
      ;
  };
}
