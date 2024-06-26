{
  lib,
  config,
  pkgs,
  ...
}: {
  fonts = {
    packages = [
      (
        pkgs.nerdfonts.override {
          fonts = [
            "Iosevka"
            "JetBrainsMono"
          ];
        }
      )
    ];
  };
}
