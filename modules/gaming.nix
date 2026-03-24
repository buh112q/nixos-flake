{pkgs, ...}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
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
