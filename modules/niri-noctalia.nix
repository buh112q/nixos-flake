{ config, pkgs, ... }: {
	services.displayManager.ly.enable = true;
	programs.niri.enable = true;
	services.gvfs.enable = true;
	programs.dconf.enable = true;
	environment.systemPackages = with pkgs; [
		xwayland-satellite
	  	wl-clipboard
	  	noctalia-shell
	 	fuzzel
		kitty
		nautilus
	  	chromium
	  	localsend
	  	zed-editor
	  	papirus-icon-theme
	  ];
}
