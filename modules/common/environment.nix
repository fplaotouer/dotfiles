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
      inherit (pkgs) curl;
      inherit (pkgs) libllvm lld lldb clang-tools;
      inherit (pkgs) nasm qemu ninja ffmpeg;
      inherit (pkgs) zig zls;
    };
  };
}
