{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.neovide;
  settingsFormat = pkgs.formats.json {};
  settingsFile = settingsFormat.generate "neovide-settings" cfg.settings;
in {
  options.programs.neovide = {
    enable = lib.mkEnableOption ''
      neovide is a simple, no-nonsense, cross-platform graphical user interface
      for Neovim (an aggressively refactored and updated Vim editor)
    '';
    settings = lib.mkOption {
      type = settingsFormat.type;
      default = {};
      example = lib.literalExpression ''
        {
          window = "Maximized";
        }
      '';
      description = ''
        Configuration written to
        <filename>$XDG_DATA_HOME/nvim/neovide-settings.json</filename>.
      '';
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.neovide];
    xdg.dataFile."nvim/neovide-settings.json" = lib.mkIf (cfg.settings != {}) {
      source = settingsFile;
    };
  };
}
