{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.swarm;
in {
  options.programs.swarm = {
    enable = lib.mkEnableOption "Resource gathering + programming game";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [pkgs.haskellPackages.swarm];
    };
  };
}
