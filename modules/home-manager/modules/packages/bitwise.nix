{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.bitwise;
in {
  options.programs.bitwise = {
    enable = lib.mkEnableOption "Terminal based bit manipulator in ncurses";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.bitwise];
  };
}
