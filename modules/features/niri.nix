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
      enableSystemMonitoring = true;
      enableVPN = true;
      enableDynamicTheming = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      enableClipboardPaste = true;
    };
    services.udisks2.enable = true;
    services.gvfs.enable = true;
    environment.systemPackages = with pkgs; [
      xwayland-satellite
      wl-clipboard
      ghostty
      nautilus
    ];
  };
}
