{
  lib,
  config,
  pkgs,
  ...
}: {
  xdg.stateFile."bash/.keep".text = "";
  programs.bash = {
    package = null;
    enableCompletion = true;
    historyFile = "${config.xdg.stateHome}/bash/history";
  };
}
