{
  lib,
  self,
  ...
}: {
  imports = [
    self.inputs.home-manager.nixosModules.home-manager
    ./../common
    ./modules
  ];

  system.stateVersion = lib.mkDefault "25.05";
}
