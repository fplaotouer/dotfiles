{
  lib,
  config,
  pkgs,
  ...
}: let
  userCargoConfig = {
    registry.default = "crates-io";
    registries.crates-io.protocol = "sparse";
    source = {
      rsproxy.registry = "https://rsproxy.cn/crates.io-index";
      rsproxy-sparse.registry = "sparse+https://rsproxy.cn/index/";
    };
    net = {
      git-fetch-with-cli = true;
    };
  };
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
