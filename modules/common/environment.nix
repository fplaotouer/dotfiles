{
  lib,
  config,
  pkgs,
  ...
}: {
  environment = {
    pathsToLink = [
      "/share/zsh"
      "/share/bash-completion"
      "/share/qemu"
      "/share/xdg-desktop-portal"
      "/share/applications"
    ];
    systemPackages = builtins.attrValues {
      inherit
        (pkgs)
        ffmpeg
        ninja
        pkg-config
        qemu
        ;
    };
  };
}
