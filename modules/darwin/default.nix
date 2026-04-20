{
  lib,
  self,
  ...
}: {
  imports = [
    self.inputs.home-manager.darwinModules.home-manager
    self.inputs.sops-nix.darwinModules.sops
    ./../common
    ./modules
  ];

  nix.settings.use-case-hack = true;
  security.pam.services.sudo_local.touchIdAuth = true;
  system.stateVersion = lib.mkDefault 6;
}
