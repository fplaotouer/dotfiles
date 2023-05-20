{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.toolchains.ccpp;
in {
  options.toolchains.ccpp = {
    enable = lib.mkEnableOption "Enable CMake and conan package manager";
  };

  config = lib.mkIf (cfg.enable) {
    home.sessionVariables = {
      CONAN_HOME = "${config.xdg.configHome}/conan";
    };

    home.packages = builtins.attrValues {
      inherit (pkgs) ccls cmake conan cmake-language-server;
    };
  };
}
