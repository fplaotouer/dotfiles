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
