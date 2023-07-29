{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.toolchains.zig;
in {
  options.toolchains.zig = {
    enable = lib.mkEnableOption "General-purpose programming language and toolchain for maintaining robust, optimal, and reusable software.";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = builtins.attrValues {
      inherit (pkgs) zig zls;
    };
  };
}
