{
  lib,
  self,
  ...
}: {
  nixpkgs = {
    overlays = builtins.attrValues self.overlays;
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "appcleaner"
          "the-unarchiver"
        ];
    };
  };
}
