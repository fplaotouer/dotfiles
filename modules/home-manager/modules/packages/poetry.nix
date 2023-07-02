{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.poetry;
in {
  options.programs.poetry = {
    enable = lib.mkEnableOption "Python dependency management and packaging made easy";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.poetry];
  };
}
