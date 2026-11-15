{
  lib,
  config,
  pkgs,
  ...
}: let
  userCargoConfig = {};
  settingsFormat = pkgs.formats.toml {};
  settingsFile = settingsFormat.generate "user-cargo-config" userCargoConfig;
in {
  home = {
    sessionVariables = {
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    };
    sessionPath = ["${config.xdg.dataHome}/cargo/bin"];
  };

  xdg.dataFile."cargo/config.toml" = lib.mkIf (userCargoConfig != {}) {
    source = settingsFile;
  };
}
