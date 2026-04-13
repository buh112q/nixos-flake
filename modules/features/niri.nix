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
    programs.niri.enable = true;
    programs.dconf.enable = true;
    services.udisks2.enable = true;
    services.gvfs.enable = true;
    programs.dms-shell = {
      enable = true;
      systemd = {
        enable = true;
        restartIfChanged = true;
      };
      enableSystemMonitoring = true;
      enableVPN = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      enableClipboardPaste = true;
    };
    environment.systemPackages = with pkgs; [
      xwayland-satellite
      wl-clipboard
      nautilus
      kitty
    ];
  };
}
