{
  lib,
  config,
  pkgs,
  ...
}: {
  # Nix configurations shared among NixOS, home-manager and nix-darwin
  nix = {
    package = lib.mkDefault pkgs.nixVersions.stable;
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = ["root" "pangz"];
      bash-prompt = "[nix]λ ";
      sandbox = false;
      auto-optimise-store = true;
      keep-derivations = true;
      keep-outputs = false;
      use-case-hack = true;
    };
  };
}
