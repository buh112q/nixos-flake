{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.getty = {
    autologinUser = "sock";
    # autologinOnce = true;
  };
  environment.loginShellInit = ''
    if [ -z "$DISPLAY" ] && [ "$(tty)"="/dev/tty1" ]; then
      exec niri-session
    fi
  '';
  programs = {
    niri.enable = true;
    dconf.enable = true;
  };
  services.gvfs.enable = true;
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wl-clipboard
    noctalia-shell
    fuzzel
    kitty
    nautilus
    chromium
    localsend
    vscodium-fhs
    bibata-cursors
    papirus-icon-theme
  ];
}
