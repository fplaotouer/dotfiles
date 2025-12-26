{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.icdiff;
in {
  options.programs.icdiff = {
    enable = lib.mkEnableOption "Side-by-side highlighted command line diffs";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.icdiff];
  };
}
