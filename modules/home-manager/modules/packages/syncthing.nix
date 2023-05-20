{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.syncthing;
in {
  options.programs.syncthing = {
    enable = lib.mkEnableOption "Open Source Continuous File Synchronization";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.syncthing];
  };
}
