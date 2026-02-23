{pkgs, ...}: {
  environment = {
    pathsToLink = [
      "/share/zsh"
      "/share/bash-completion"
      "/share/qemu"
      "/share/xdg-desktop-portal"
      "/share/applications"
    ];
    systemPackages = builtins.attrValues {
      inherit (pkgs) nasm zig zls;
      inherit (pkgs) libllvm lld lldb clang-tools ninja;
      inherit (pkgs) qemu ffmpeg;
      inherit (pkgs) curl;
    };
  };
}
