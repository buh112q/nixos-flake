{ pkgs, ... }:
{
  home.username = "sock";
  home.homeDirectory = "/home/sock";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "sudo"
        "history-substring-search"
      ];
    };
  };
  programs.git = {
    enable = true;
    userName = "buh112q";
    userEmail = "lnwpoom.zaa123@gmail.com";
  };
  home.packages = with pkgs; [
    fastfetch
    btop
    tree
    bat
    duf
  ];
  home.file = { };
  home.sessionVariables = {
    QS_ICON_THEME = "Papirus-Dark";
    # EDITOR = "emacs";
  };
  programs.home-manager.enable = true;
}
