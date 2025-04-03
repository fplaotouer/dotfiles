{pkgs, ...}: {
  programs.alacritty = {
    settings = {
      general = {
        live_config_reload = true;
        import = [];
      };
      env = {};
      window = {
        option_as_alt = "OnlyLeft";
        decorations = "full";
        opacity = 0.8;
        startup_mode = "Fullscreen";
        title = "Alacritty";
        dynamic_title = true;
        dimensions = {
          columns = 0;
          lines = 0;
        };
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      font = {
        size = 16.0;
        normal = {
          family = "IosevkaTerm Nerd Font";
          style = "Regular";
        };
      };
      colors = {
        transparent_background_colors = true;
        draw_bold_text_with_bright_colors = false;
        primary = {
          background = "#1d2021";
          foreground = "#d5c4a1";
        };
        cursor = {
          text = "#1d2021";
          cursor = "#d5c4a1";
        };
        normal = {
          black = "#1d2021";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#d5c4a1";
        };
        bright = {
          black = "#665c54";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#fbf1c7";
        };
      };
      selection = {
        save_to_clipboard = true;
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
      };
      cursor = {
        unfocused_hollow = true;
        thickness = 0.15;
        style = {
          shape = "Block";
          blinking = "Off";
        };
      };
      terminal = {
        shell = {
          program = "${pkgs.fish}/bin/fish";
          args = [
            "--login"
            # "-c"
            # "zellij --layout compact attach --index 0 --create"
          ];
        };
      };
      mouse = {
        hide_when_typing = false;
        bindings = [];
      };
      keyboard.bindings = [];
    };
  };
}
