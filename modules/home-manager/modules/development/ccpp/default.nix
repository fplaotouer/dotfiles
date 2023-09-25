{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.toolchains.ccpp;
in {
  options.toolchains.ccpp = {
    enable = lib.mkEnableOption "Enable clangd and CMake";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = builtins.attrValues {
      inherit (pkgs) clang-tools cmake;
    };
  };
}
