{pkgs, ...}: {
  environment = {
    systemPackages = builtins.attrValues {
      inherit (pkgs) ghostty-bin llama-cpp utm;
    };
  };
}
