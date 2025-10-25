{pkgs, ...}: {
  programs.ghostty = {
    package = null;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      theme = "Gruvbox Dark";
      font-family = "IosevkaTerm Nerd Font Mono";
      font-size = 16;
      command = "${pkgs.fish}/bin/fish --login";
      cursor-style = "block";
      cursor-style-blink = false;
      background-opacity = 0.8;
      background-blur = true;
      fullscreen = true;
      quit-after-last-window-closed = true;
      macos-option-as-alt = "left";
      macos-auto-secure-input = true;
      macos-secure-input-indication = true;
      window-inherit-font-size = true;
      shell-integration-features = true;
    };
  };
}
