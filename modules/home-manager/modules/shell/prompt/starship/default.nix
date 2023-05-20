{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.starship = {
    package = pkgs.starship;
    settings = {
      scan_timeout = 10;
      add_newline = false;
      character = {
        success_symbol = "[λ](bold green) ";
        error_symbol = "[✗](bold red) ";
        vicmd_symbol = "[V](bold green) ";
      };
    };
  };
}
