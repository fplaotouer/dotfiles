{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.mtr;
in {
  options.programs.mtr = {
    enable = lib.mkEnableOption "A network diagnostics tool";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.mtr];
  };
}
