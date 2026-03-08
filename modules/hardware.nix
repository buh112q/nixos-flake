{ config, lib, pkgs, ...}:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  hardware.i2c.enable = true;
  hardware.bluetooth.enable = true;
}
