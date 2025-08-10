{ pkgs, ... }: {
	nixpkgs.config.allowUnfree = true;
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
		extraPackages = with pkgs; [
			nvidia-vaapi-driver
		];
	};

	services.xserver.videoDrivers = [ "nvidia" ];
	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = true;
		powerManagement.finegrained = false;
		open = true;
		nvidiaSettings = true;
	};
}
