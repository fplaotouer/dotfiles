{config, ...}: {
  programs.bash = {
    package = null;
    enableCompletion = true;
    historyFile = "${config.xdg.stateHome}/bash/history";
  };
}
