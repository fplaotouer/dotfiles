{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.hyperfine;
in {
  options.programs.hyperfine = {
    enable = lib.mkEnableOption "Command-line benchmarking tool";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.hyperfine];
  };
}
