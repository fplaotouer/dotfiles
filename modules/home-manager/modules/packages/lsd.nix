{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.lsd = {
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };
}
