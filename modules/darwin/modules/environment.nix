{
  lib,
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = builtins.attrValues {
      inherit
        (pkgs)
        iina
        xmake
        ;
    };
  };
}
