{...}: {
  programs.bat = {
    config = {
      map-syntax = [
        "*.jenkinsfile:Groovy"
        "*.props:Java Properties"
      ];
      pager = "less -FR";
      theme = "gruvbox-dark";
    };
    themes = {};
  };
}
