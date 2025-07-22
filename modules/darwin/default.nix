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
  security.pam.services.sudo_local.touchIdAuth = true;
  system.stateVersion = lib.mkDefault 6;
}
