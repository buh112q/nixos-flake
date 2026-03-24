{pkgs, ...}: {
  imports = [
    ./home-manager/foot.nix
  ];
  home.username = "sock";
  home.homeDirectory = "/home/sock";
  home.stateVersion = "25.11";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {};

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = [
      "rm *"
      "pkill *"
      "cp *"
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "agnoster";
    };
  };
  programs.git = {
    enable = true;
    settings.user = {
      name = "buh112q";
      email = "lnwpoom.zaa123@gmail.com";
    };
  };
  home.packages = with pkgs; [
    btop
    tree
    bat
    duf
    fzf
    ripgrep
    fastfetch
  ];
  home.file = {};
  home.sessionVariables = {
    QS_ICON_THEME = "Papirus-Dark";
    EDITOR = "micro";
  };
  programs.home-manager.enable = true;
}
