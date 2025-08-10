{ pkgs, inputs, ... }: {
  
	imports = [inputs.stylix.homeModules.stylix];

	# Fonts
	home.packages = with pkgs; [
		font-awesome
		# TESTING
		dejavu_fonts
		jetbrains-mono
		noto-fonts
		noto-fonts-lgc-plus
		texlivePackages.hebrew-fonts
		noto-fonts-emoji
		font-awesome
		powerline-fonts
		powerline-symbols
		nerd-fonts.symbols-only

	];
	#fonts.fontconfig.enable = true;  

	stylix = {
		enable = true;
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

		targets = {
			nixvim.enable = false;
			waybar.enable = false;
			wofi.enable = false;
			hyprland.enable = false;
			hyprlock.enable = false;
		};

		cursor = {
			name = "DMZ-Black";
			size = 24;
			package = pkgs.vanilla-dmz;
		};

		image = ./../../wallpapers/garrett-parker-DlkF4-dbCOU.jpg;
	};
}
