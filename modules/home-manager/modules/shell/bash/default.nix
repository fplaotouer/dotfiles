{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.bash = {
    enableCompletion = true;
    historyFile = "${config.xdg.stateHome}/bash/history";
  };
}
