{pkgs, ...}: {
  programs.yazi.settings = {
    shellWrapperName = "y";
    extraPackages = builtins.attrValues {
      inherit (pkgs) glow ouch;
    };
  };
}
