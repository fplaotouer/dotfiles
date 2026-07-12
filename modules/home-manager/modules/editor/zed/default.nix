{pkgs, ...}: {
  programs.zed-editor = {
    package = null;
    extensions = ["haskell" "zig" "toml"];
    userSettings = {
      vim_mode = true;
      disable_ai = true;
      buffer_font_family = "Iosevka Nerd Font Mono";
      relative_line_numbers = "wrapped";
      inlay_hints = {
        enabled = true;
      };
      diagnostics = {
        inline = {
          enabled = true;
        };
      };
      edit_prediction = {
        provider = "none";
      };
      project_panel = {
        hide_hidden = true;
      };
      tabs = {
        show_diagnostics = "errors";
      };
      title_bar = {
        show_sign_in = false;
      };
      status_bar = {
        active_encoding_button = "enabled";
        line_endings_button = true;
      };
      terminal = {
        font_family = "IosevkaTerm Nerd Font Mono";
        shell = {
          with_arguments = {
            program = "${pkgs.fish}/bin/fish";
            args = ["--login"];
          };
        };
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };
  };
}
