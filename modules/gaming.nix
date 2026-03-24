{pkgs, ...}: {
  programs.steam = {
    enable = true;
    gamescopeSession = {
      enable = true;
      args = [
        "-W 1920"
        "-H 1080"
        "-r 100"
        "-f"
        "-e"
        "--immediate-flips"
      ];
    };
  };
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [
    protonplus
    goverlay
    heroic
  ];
}
