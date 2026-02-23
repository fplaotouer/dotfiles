{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.dust;
in {
  options.programs.dust = {
    enable = lib.mkEnableOption "A more intuitive version of du in rust";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.dust];
  };
}
