{ user, hostname, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        history.size = 10000;
        
        # Just essential aliases
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake ~/nix#${hostname}";
            home-rebuild = "home-manager switch --flake ~/nix#${user}@${hostname}";
            nixgc = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d";
            c = "code-insiders";
            cs = "code";  # Stable VS Code (less frequent updates)
            
            # Open PDF in Windows default viewer (for LaTeX)
            pdf = "explorer.exe";  # Usage: pdf myfile.pdf
        };
        
        # Simple same-line prompt + tmux auto-launch
        initContent = ''
            # Simple prompt (same line)
            PROMPT='%F{blue}%n@%m%f:%F{cyan}%~%f $ '
            
            # Auto-launch tmux (WSL optimized)
            if [ -z "$TMUX" ] && [ -z "$VSCODE_INJECTION" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
                tmux attach-session -t default || tmux new-session -s default
            fi
        '';
    };
}
