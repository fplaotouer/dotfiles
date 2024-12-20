{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.uv;
in {
  options.programs.uv = {
    enable = lib.mkEnableOption "Extremely fast Python package installer and resolver, written in Rust";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.uv];
  };
}
