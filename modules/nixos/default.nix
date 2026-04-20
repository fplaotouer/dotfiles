{
  lib,
  self,
  ...
}: {
  imports = [
    self.inputs.home-manager.nixosModules.home-manager
    self.inputs.sops-nix.nixosModules.sops
    ./../common
    ./modules
  ];

  system.stateVersion = lib.mkDefault "25.05";
}
