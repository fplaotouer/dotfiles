{pkgs, ...}: {
  programs.yazi = {
    shellWrapperName = "y";
    extraPackages = builtins.attrValues {
      inherit (pkgs) glow ouch;
    };
    settings = {};
  };
}
