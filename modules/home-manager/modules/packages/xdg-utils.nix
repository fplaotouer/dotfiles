{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.xdg-utils;
in {
  options.programs.xdg-utils = {
    enable = lib.mkEnableOption "A set of command line tools that assist applications with a variety of desktop integration tasks";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.xdg-utils];
  };
}
