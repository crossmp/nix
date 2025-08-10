{ user, hostname, ... }:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		history.size = 10000;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake ~/nix#${hostname}";
			home-rebuild = "home-manager switch --flake ~/nix#${user}@${hostname}";
			gc = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d";
			tmux = "tmux attach-session -t default || tmux new-session -s default";
		};
		initContent = ''
			# Auto-launch tmux only if not in VS Code and not already in tmux
			if [ -z "$TMUX" ] && [ -z "$VSCODE_INJECTION" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
				tmux attach-session -t default || tmux new-session -s default
			fi

			# Auto-launch UWSM/Hyprland only for matt@nixos-laptop
			if [ "$USER" = "matt" ] && [ "$HOSTNAME" = "nixos-laptop" ]; then
				if uwsm check may-start > /dev/null && uwsm select; then
					exec systemd-cat -t uwsm_start uwsm start default
				fi
			fi
		'';
	};
}
