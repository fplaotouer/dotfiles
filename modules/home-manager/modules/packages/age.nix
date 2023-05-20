{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.age;
in {
  options.programs.age = {
    enable = lib.mkEnableOption "A simple, modern and secure encryption tool (and Go library) with small explicit keys, no config options, and UNIX-style composability.";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.age];
  };
}
