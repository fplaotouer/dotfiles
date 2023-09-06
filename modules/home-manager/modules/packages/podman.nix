{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.podman;
in {
  options.programs.podman = {
    enable = lib.mkEnableOption "A program for managing pods, containers and container images";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.podman pkgs.podman-compose];
  };
}
