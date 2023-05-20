{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.du-dust;
in {
  options.programs.du-dust = {
    enable = lib.mkEnableOption "A more intuitive version of du in rust";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.du-dust];
  };
}
