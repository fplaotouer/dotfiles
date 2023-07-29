{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.go;
in {
  config = lib.mkIf (cfg.enable) {
    home.packages = builtins.attrValues {
      inherit (pkgs) gopls delve gofumpt;
    };
    home.sessionPath = ["${config.home.homeDirectory}/${cfg.goBin}"];
    programs.go = {
      package = pkgs.go;
      goPath = ".go";
      goBin = ".go/bin";
      packages = {};
    };
  };
}
