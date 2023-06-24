{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    autocd = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    history.path = "${config.xdg.dataHome}/zsh/history";
  };
}
