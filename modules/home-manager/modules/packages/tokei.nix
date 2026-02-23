{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.tokei;
in {
  options.programs.tokei = {
    enable = lib.mkEnableOption "Count your code, quickly.";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.tokei];
  };
}
