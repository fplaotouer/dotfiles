{
  lib,
  config,
  pkgs,
  ...
}: {
  toolchains.rust.userCargoConfig = {
    build = {
      rustc-wrapper = "${pkgs.sccache}/bin/sccache";
    };
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
}
