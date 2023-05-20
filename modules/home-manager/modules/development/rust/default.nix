{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./toolchains.nix
    ./userCargoConfig.nix
  ];

  home.sessionVariables = {
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
  };

  home.sessionPath = ["${config.xdg.dataHome}/cargo/bin"];
}
