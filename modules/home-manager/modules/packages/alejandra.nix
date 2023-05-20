{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.alejandra;
in {
  options.programs.alejandra = {
    enable = lib.mkEnableOption "The Uncompromising Nix Code Formatter";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.alejandra];
  };
}
