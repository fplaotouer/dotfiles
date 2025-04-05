{
  lib,
  self,
  ...
}: {
  imports = [
    self.inputs.home-manager.darwinModules.home-manager
    ./../common
    ./modules
  ];

  nix = {
    settings = {
      sandbox = false;
      use-case-hack = true;
    };
  };
  system.stateVersion = lib.mkDefault 6;
}
