{pkgs, ...}: {
  programs.zed-editor = {
    package = null;
    extensions = ["haskell" "zig" "toml"];
    userSettings = {
      vim_mode = true;
      disable_ai = true;
      buffer_font_family = "Iosevka Nerd Font Mono";
      inlay_hints = {
        enabled = true;
      };
      features = {
        edit_prediction_provider = "none";
      };
      project_panel = {
        hide_hidden = true;
      };
      title_bar = {
        show_sign_in = false;
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
