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

  config = lib.mkIf (cfg.enable) {
    home = {
      packages = [pkgs.hledger pkgs.hledger-ui pkgs.hledger-web];
      file.".hledger/declaration.journal".source = ./declaration.journal;
      shellAliases = {
        hl = "hledger";
      };
      sessionVariables = {
        LEDGER_FILE = "$HOME/.hledger/current.journal";
      };
    };
  };
}
