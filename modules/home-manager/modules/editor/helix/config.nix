{...}: {
  programs.helix.settings = {
    theme = "gruvbox";
    editor = {
      mouse = true;
      scrolloff = 3;
      rulers = [120];
      line-number = "relative";
      cursorline = true;
      auto-completion = true;
      auto-format = true;
      auto-pairs = true;
      auto-info = true;
      idle-timeout = 0;
      completion-trigger-len = 1;
      true-color = true;
      color-modes = true;
      bufferline = "multiple";
      lsp = {
        snippets = true;
        display-inlay-hints = true;
        display-messages = true;
        auto-signature-help = true;
        display-signature-help-docs = true;
      };
      indent-guides = {
        render = true;
        character = "┆";
      };
      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "block";
      };
      whitespace.render = {
        space = "all";
        tab = "all";
        newline = "none";
      };
    };
    keys = {
      normal = {
        esc = ["collapse_selection" "keep_primary_selection"];
        up = "no_op";
        down = "no_op";
        left = "no_op";
        right = "no_op";
        pageup = "no_op";
        pagedown = "no_op";
        home = "no_op";
        end = "no_op";
      };
      insert = {
        up = "no_op";
        down = "no_op";
        left = "no_op";
        right = "no_op";
        pageup = "no_op";
        pagedown = "no_op";
        home = "no_op";
        end = "no_op";
      };
    };
  };
}
