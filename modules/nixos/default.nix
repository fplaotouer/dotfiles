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
        ffmpeg
        qemu
        ;
    };
  };
}
