{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    autocd = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    history.path = "${config.xdg.stateHome}/zsh/history";
  };
}
