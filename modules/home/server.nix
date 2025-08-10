{ config, pkgs, ... }: {
	programs.bash = {
		enable = true;
    
		shellAliases = {
			server-test = "echo 'Server config is working'";
		};
	};
}
