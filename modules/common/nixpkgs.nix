{
  lib,
  self,
  ...
}: {
  nixpkgs = {
    overlays = self.overlays;
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
        ];
    };
  };
}
