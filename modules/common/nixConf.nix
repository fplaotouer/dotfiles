{
  lib,
  config,
  pkgs,
  ...
}: {
  nix = {
    package = lib.mkDefault pkgs.nixVersions.stable;
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = ["root" "pangz"];
      keep-derivations = true;
      keep-outputs = false;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 2d";
    };
  };
}
