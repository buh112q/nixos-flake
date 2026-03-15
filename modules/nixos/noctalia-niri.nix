{
  pkgs,
  ...
}:
{
  services = {
    getty.autologinUser = "sock";
    gnome.gnome-keyring.enable = true;
  };
  security.pam.services.getty.enableGnomeKeyring = true;
  environment.loginShellInit = ''
    	if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    		exec niri-session -l
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
