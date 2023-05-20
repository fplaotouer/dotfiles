{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.xplr;
in {
  options.programs.xplr = {
    enable = lib.mkEnableOption "A hackable, minimal, fast TUI file explorer";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.xplr];
  };
}
