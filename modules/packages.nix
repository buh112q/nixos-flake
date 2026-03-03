{ pkgs, ...}: {
	environment.systemPackages = with pkgs; [
	  	papirus-icon-theme
		nautilus
		alacritty
		kitty
		waybar
		rofi
	 	fuzzel
	  	chromium
	  	localsend
	  	wl-clipboard
		xwayland-satellite
	  ];
}
