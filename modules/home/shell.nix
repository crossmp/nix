{ config, ... }: {

	# EXPERIMENT WITH THIS

	programs.bash = {
		enable = true;
		#enableCompletion = true;
		#autosuggestion.enable = true;
		#syntaxHighlighting.enable = true;

		#history.size = 10000;
		#history.path = "${config.xdg.dataHome}/zsh/history";

		initExtra = ''
			# Start Tmux automatically if not already running. No Tmux in TTY
			#if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
			#  tmux attach-session -t default || tmux new-session -s default
			#fi

			# Start UWSM
			if uwsm check may-start > /dev/null && uwsm select; then
				exec systemd-cat -t uwsm_start uwsm start default
			fi

      
			#if uwsm check may-start; then
			#  exec uwsm start hyprland-uwsm.desktop      
			#fi
		'';
		shellAliases = {
			test = "echo alias works";
			ssw = "sudo nixos-rebuild switch --flake ~/nix#nixos-laptop";
			hsw = "home-manager switch --flake ~/nix#matt";
      
			# SUGGESTED ADDITIONS
			# Update flake inputs (this updates all your packages)
			#upd = "nix flake update ~/nix && sudo nixos-rebuild switch --flake ~/nix#nixos-laptop && home-manager switch --flake ~/nix#matt";
      
			# Just update flake lock file
			#updlock = "nix flake update ~/nix";
      
			# System rebuild with boot (safer for major updates)
			#sboot = "sudo nixos-rebuild boot --flake ~/nix#nixos-laptop";
      
			# Check what would be updated without building
			#check = "nix flake show ~/nix";
       
		};
	};
}
