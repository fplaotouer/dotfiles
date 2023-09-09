{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.toolchains.rust;
  settingsFormat = pkgs.formats.toml {};
  settingsFile = settingsFormat.generate "user-cargo-config" cfg.userCargoConfig;
in {
  options.toolchains.rust = {
    enable = lib.mkEnableOption "A language empowering everyone to build reliable and efficient software.";
    userCargoConfig = lib.mkOption {
      type = settingsFormat.type;
      default = {};
      example = lib.literalExpression ''
        {
          build = {
            target-dir = "target";
          };
          net = {
            git-fetch-with-cli = true;
          };
        }
      '';
      description = ''
        Configuration written to
        <filename>$CARGO_HOME/config.toml</filename>,
        which is actually
        <filename>$XDG_DATA_HOME/cargo/config.toml</filename>.
        </para><para>
        See <link xlink:href="https://doc.rust-lang.org/cargo/reference/config.html" />
        for the full list of options.
      '';
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = builtins.attrValues {
      inherit
        (pkgs)
        rust-analyzer
        lldb
        lld
        sccache
        graphviz
        taplo-cli
        cargo-binutils
        cargo-expand
        cargo-zigbuild
        cargo-criterion
        cargo-wasi
        cargo-make
        cargo-fuzz
        cargo-msrv
        cargo-cache
        cargo-bloat
        cargo-generate
        cargo-local-registry
        ;
    };

    xdg.dataFile."cargo/config.toml" = lib.mkIf (cfg.userCargoConfig != {}) {
      source = settingsFile;
    };
  };
}
