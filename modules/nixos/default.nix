{
  lib,
  config,
  pkgs,
  ...
}: {
  environment = {
    pathsToLink = ["/share/qemu"];
    systemPackages = builtins.attrValues {
      inherit
        (pkgs)
        qemu
        ffmpeg
        llvm-manpages
        libllvm
        ;
    };
  };
}
