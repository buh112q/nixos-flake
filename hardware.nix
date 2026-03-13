{
  config,
  lib,
  pkgs,
  ...
}:
{
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    i2c.enable = true;
    bluetooth.enable = true;
  };
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };
}
