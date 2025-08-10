{ user, hostname, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        history.size = 10000;
        
        # Enhanced shell aliases for productivity
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake ~/nix#${hostname}";
            home-rebuild = "home-manager switch --flake ~/nix#${user}@${hostname}";
            gc = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d";
            clean = "nix-store --gc && nix-collect-garbage -d";    
            c = "code-insiders";
            
            # Git shortcuts (you'll use these a lot)
            g = "git";
            ga = "git add";
            gc = "git commit";
            gp = "git push";
            gl = "git pull";
            gs = "git status";
            gd = "git diff";
            
            # Better ls
            ls = "ls --color=auto";
            ll = "ls -alF";
            la = "ls -A";
            l = "ls -CF";
            
            # Python development shortcuts
            py = "python3";
            pip = "python3 -m pip";
            venv = "python3 -m venv";
            
            # Quick navigation
            ".." = "cd ..";
            "..." = "cd ../..";
            "...." = "cd ../../..";
        };
        
        # Custom prompt colors (Kanagawa-inspired)
        initContent = ''
            # Kanagawa-inspired zsh colors
            export LS_COLORS="di=1;34:ln=1;36:so=1;35:pi=1;33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;31:tw=1;34:ow=1;34"
            
            # Custom minimal prompt (clean and informative)
            autoload -U colors && colors
            setopt PROMPT_SUBST
            
            # Git branch function
            git_branch() {
                git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
            }
            
            # Custom prompt: user@host:path (git) $
            PROMPT='%F{blue}%n%f@%F{cyan}%m%f:%F{yellow}%~%f %F{green}$(git_branch)%f
%F{white}$%f '
            
            # Auto-launch tmux (WSL optimized - no DISPLAY check needed)
            if [ -z "$TMUX" ] && [ -z "$VSCODE_INJECTION" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
                tmux attach-session -t default || tmux new-session -s default
            fi
        '';
    };
}
