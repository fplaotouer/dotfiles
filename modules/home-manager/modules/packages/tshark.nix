{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.tshark;
in {
  options.programs.tshark = {
    enable = lib.mkEnableOption "Powerful network protocol analyzer";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.tshark];
  };
}
