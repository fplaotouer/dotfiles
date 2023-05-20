{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.kitty = {
    theme = "Gruvbox Dark";
    font = {
      name = "IosevkaTerm Nerd Font";
      size = 16.0;
    };
    settings = {
      scrollback_lines = 10000;
      remember_window_size = true;
      "modify_font cell_height" = "80%";
      "modify_font baseline" = "4.5";
      macos_option_as_alt = true;
      shell = "${pkgs.fish}/bin/fish --login";
    };
    environment = {};
    keybindings = {};
    extraConfig = "";
  };
}
