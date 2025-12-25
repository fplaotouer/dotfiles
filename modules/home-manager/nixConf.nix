{
  lib,
  pkgs,
  self,
  ...
}: {
  nix = {
    package = lib.mkDefault pkgs.nixVersions.stable;
    settings = {
      experimental-features = "nix-command flakes";
      allowed-users = ["root" "pangz"];
      trusted-users = ["root" "pangz"];
      substitute = true;
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      keep-derivations = true;
      keep-outputs = false;
    };
    registry = {
      n.flake = self;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 2d";
    };
  };
}
