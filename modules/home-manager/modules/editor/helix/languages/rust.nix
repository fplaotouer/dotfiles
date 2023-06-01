{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.helix.languages = {
    rust = {
      name = "rust";
      config = {
        cargo.allFeatures = true;
        completion.postfix.enable = false;
        lens = {
          run = false;
          debug = false;
        };
        inlayHints = {
          reborrowHints = true;
          closureReturnTypeHints = true;
        };
      };
    };
  };
}
