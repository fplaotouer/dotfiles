{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.ripgrep;
in {
  options.programs.ripgrep = {
    enable = lib.mkEnableOption "A utility that combines the usability of The Silver Searcher with the raw speed of grep";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.ripgrep];
  };
}
