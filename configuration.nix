{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/niri-noctalia.nix
      ./modules/lesser-pkgs.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages; ## LTS
  ###linuxPackges_latest
  networking.hostName = "NixOS";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Bangkok";
  i18n.defaultLocale = "en_US.UTF-8";
  fonts.packages = with pkgs; [
	noto-fonts
	noto-fonts-cjk-sans
	nerd-fonts.jetbrains-mono
  ];
  zramSwap = {
      enable = true;
      priority = 100;
      algorithm = "lz4";
      memoryPercent = 50;
    };
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  hardware.graphics = {
  	enable = true;
  	enable32Bit = true;
  };
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  hardware.i2c.enable = true;
  hardware.bluetooth.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.chromium.enable = true;
  programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "agnoster"; # Or choose another theme
        plugins = [ "git" "history" "npm" "sudo" "history-substring-search"  ]; # Add desired plugins
      };
    };
  users.users.sock = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "sock";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
    packages = with pkgs; [];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	micro
  	git
  	gh
  ];
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  system.stateVersion = "25.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
