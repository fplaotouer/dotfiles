{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.ouch;
in {
  options.programs.ouch = {
    enable = lib.mkEnableOption "Painless compression and decompression for your terminal";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.ouch];
  };
}
