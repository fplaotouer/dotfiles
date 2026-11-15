{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.hledger;
in {
  options.programs.hledger = {
    enable = lib.mkEnableOption "hledger is fast, reliable, free, multicurrency double-entry accounting software that runs on unix, mac, windows, and the web.";
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = builtins.attrValues {
        inherit
          (pkgs)
          hledger
          hledger-iadd
          hledger-ui
          # hledger-web
          ;
      };
      file.".hledger" = {
        source = ./files;
        recursive = true;
      };
      shellAliases = {
        hl = "${pkgs.hledger}/bin/hledger";
      };
      sessionVariables = {
        LEDGER_FILE = "$HOME/.hledger/current.journal";
      };
    };
  };
}
