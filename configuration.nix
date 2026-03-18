{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/ssh.nix
    ./modules/noctalia-niri.nix
    ./modules/gaming.nix
    ./modules/nvf.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
  ];
  # hardware host
  zramSwap.enable = true;
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

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
  };
  programs.zsh.enable = true;
  users.users.sock = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
    packages = with pkgs; [];
  };
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  environment.systemPackages = with pkgs; [
    alejandra
    nixd
    micro
    git
  ];
  system.stateVersion = "25.11";
}
