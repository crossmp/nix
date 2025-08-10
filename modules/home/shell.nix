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
            clean = "nix-store --gc && nix-collect-garbage -d";    
        };
        initContent = ''
            # Auto-launch tmux (not in VS Code or if already in tmux)
            if [ -z "$TMUX" ] && [ -n "$DISPLAY" ] && [ -z "$VSCODE_INJECTION" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
                tmux attach-session -t default || tmux new-session -s default
            fi

            # Start UWSM & Hyprland (only on laptop)
            if [ "$HOST" = "nixos-laptop" ]; then
                if uwsm check may-start > /dev/null && uwsm select; then
                    exec systemd-cat -t uwsm_start uwsm start default
                fi
            fi
        '';
    };
}