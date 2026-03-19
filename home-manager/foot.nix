{pkgs, ...}: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font Mono:size=14";
      };
    };
  };
}
