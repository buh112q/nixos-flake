{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      nixosHardware
      nixosModule 
      gaming
      niri
      ssh
    ];
  };
  flake.nixosModules.nixosModule = {pkgs, ...}: {
    boot = {
      loader.systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;
      kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = [
        "ntsync"
      ];
      kernelParams = [
        "quiet"
        "splash"
      ];
    };
    networking ={
      hostName = "nixos";
      networkmanager.enable = true;
      firewall.enable = false;
    };
    time.timeZone = "Asia/Bangkok";
    i18n.defaultLocale = "en_US.UTF-8";
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      nerd-fonts.jetbrains-mono
    ];
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
    services.flatpak.enable = true;
    programs.appimage ={
      enable = true;
      binfmt = true;
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
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
    programs.nh ={
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep 5";
      };
    };
    programs.git = {
      enable = true;
      config = {
        user = {
          name = "buh112q";
          email = "lnwpoom.zaa123@gmail.com";
        };
      };
    };
    users.users.sock = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      packages = with pkgs; [];
    };
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    environment.systemPackages = with pkgs; [
      micro
      gearlever
      nixd
      alejandra
    ];
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.11";
    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
