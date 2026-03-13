{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs = {
    steam.enable = true;
    gamescope.enable = true;
  };
  environment.systemPackages = with pkgs; [
    goverlay
    protonplus
  ];
}
