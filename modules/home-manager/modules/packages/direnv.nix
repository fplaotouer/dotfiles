{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.direnv = {
    nix-direnv.enable = true;
  };
}
