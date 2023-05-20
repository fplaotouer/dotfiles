{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.sd;
in {
  options.programs.sd = {
    enable = lib.mkEnableOption "Intuitive find & replace CLI (sed alternative)";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.sd];
  };
}
