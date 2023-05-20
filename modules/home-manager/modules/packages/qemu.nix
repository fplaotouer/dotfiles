{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.qemu;
in {
  options.programs.qemu = {
    enable = lib.mkEnableOption "A generic and open source machine emulator and virtualizer";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.qemu];
  };
}
