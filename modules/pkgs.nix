{ pkgs, ...}: {
	environment.systemPackages = with pkgs; [
		xwayland-satellite
	  	wl-clipboard
	  	papirus-icon-theme
		nautilus
		alacritty
		kitty
		waybar
		rofi
	 	fuzzel
	  	chromium
	  	localsend
	  ];
}
