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
    ];
    systemPackages = builtins.attrValues {
      inherit
        (pkgs)
        ffmpeg
        qemu
        ;
    };
  };
}
