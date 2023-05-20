{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.aria2 = {
    settings = {};
    extraConfig = "";
  };
}
