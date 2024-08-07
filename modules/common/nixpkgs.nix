{
  lib,
  config,
  pkgs,
  ...
}: {
  nixpkgs.config = {
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
      ];
  };
}
