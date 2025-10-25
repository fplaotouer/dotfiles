{pkgs, ...}: {
  fonts = {
    packages = builtins.attrValues {
      inherit
        (pkgs)
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        ;
      inherit
        (pkgs.nerd-fonts)
        iosevka
        iosevka-term
        jetbrains-mono
        ;
    };
  };
}
