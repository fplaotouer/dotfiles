{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.neofetch;
in {
  options.programs.neofetch = {
    enable = lib.mkEnableOption "A fast, highly customizable system info script";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.neofetch];
  };
}
