{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.slides;
in {
  options.programs.slides = {
    enable = lib.mkEnableOption "Terminal based presentation tool";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.slides pkgs.graph-easy pkgs.plantuml];
  };
}
