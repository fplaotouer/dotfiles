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
      inherit (pkgs) libllvm lld lldb clang-tools;
      inherit (pkgs) nasm qemu ninja curl ffmpeg;
      inherit (pkgs) zig zls;
    };
  };
}
