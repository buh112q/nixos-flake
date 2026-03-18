{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "Gruvbox Dark";
      font-size = 14;
    };
  };
}
