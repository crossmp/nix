{ pkgs, user, hostname, ... }: {
	programs.zsh.enable = true;

	users = {
		defaultUserShell = pkgs.zsh;
		users.${user} = {
			isNormalUser = true;
			extraGroups = [ "wheel" "networkmanager" ];
			packages = with pkgs; [
				tree
			];
		};
	};

	# Auto-login only for non-WSL systems
	services.getty.autologinUser = if (hostname == "nixos") then null else user;
}
