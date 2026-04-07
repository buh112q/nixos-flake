{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri = {pkgs, ...}: {
    services.displayManager = {
      ly.enable = true;
      defaultSession = "niri";
      autoLogin = {
        enable = true;
        user = "sock";
      };
    };
    programs = {
      niri.enable = true;
      dconf.enable = true;
    };
    programs.dms-shell = {
      enable = true;
      systemd = {
        enable = true;
        restartIfChanged = true;
      };
      # Core features
      enableSystemMonitoring = true; # System monitoring widgets (dgop)
      enableVPN = true; # VPN management widget
      enableDynamicTheming = true; # Wallpaper-based theming (matugen)
      enableAudioWavelength = true; # Audio visualizer (cava)
      enableCalendarEvents = true; # Calendar integration (khal)
      enableClipboardPaste = true; # Pasting from the clipboard history (wtype)
    };
    services.udisks2.enable = true;
    services.gvfs.enable = true;
    environment.systemPackages = with pkgs; [
      xwayland-satellite
      wl-clipboard
      nautilus
      librewolf
      localsend
      vscodium-fhs
    ];
  };
}
