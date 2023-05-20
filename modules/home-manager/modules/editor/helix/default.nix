{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./languages
    ./config.nix
  ];
}
