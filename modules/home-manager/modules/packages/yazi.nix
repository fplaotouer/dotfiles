{pkgs, ...}: {
  programs.yazi = {
    shellWrapperName = "y";
    settings = {
      extraPackages = builtins.attrValues {
        inherit (pkgs) glow ouch;
      };
    };
  };
}
