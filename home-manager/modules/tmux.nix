{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = ''
      # Better colors for alacritty
      set -as terminal-features ",alacritty*:RGB"
      
      # Status bar with time (keeping it simple like gruvbox)
      set -g status-interval 1
      set -g status-right '#[fg=colour214] %d/%m #[fg=colour109] %H:%M:%S '
      set -g status-right-length 30
      
      # Reload config with Alt+r
      bind -n M-r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
      
      # Window navigation (keeping your existing ones)
      bind C-p previous-window
      bind C-n next-window
    
      # Quick window switching with Alt+number (keeping yours)
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9
    
      # Vim-style pane navigation (hjkl instead of arrows)
      bind -n M-h select-pane -L    # Alt+h = left pane (vim left)
      bind -n M-l select-pane -R    # Alt+l = right pane (vim right)
      bind -n M-k select-pane -U    # Alt+k = up pane (vim up)
      bind -n M-j select-pane -D    # Alt+j = down pane (vim down)
      
      # Keep your arrow keys too for transition period
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
    
      # Vim-style pane resizing (Shift + hjkl)
      bind -n M-S-h resize-pane -L 5   # Alt+Shift+h = shrink left
      bind -n M-S-l resize-pane -R 5   # Alt+Shift+l = expand right  
      bind -n M-S-k resize-pane -U 3   # Alt+Shift+k = shrink up
      bind -n M-S-j resize-pane -D 3   # Alt+Shift+j = expand down
      
      # Keep your old resize keys too
      bind -n M-S-Left resize-pane -L 5
      bind -n M-S-Right resize-pane -R 5
      bind -n M-S-Up resize-pane -U 3
      bind -n M-S-Down resize-pane -D 3
    
      # Split windows (keeping your binds)
      bind -n M-s split-window -v  # Alt+s = horizontal split
      bind -n M-v split-window -h  # Alt+v = vertical split
    
      # Your custom workspace shortcuts (keeping as-is)
      bind -n M-o new-window -c ~/para "nvim -c 'Telescope find_files' '0 Inbox/todolist.md'"
      bind -n M-f new-window -c ~/flake "nvim -c 'Telescope find_files' flake.nix"
      bind -n M-n new-window -c ~/.config/nvim "nvim -c 'Telescope find_files' init.lua"
      
      # Window/session management (keeping yours)
      bind -n M-n new-window   # Alt+Enter = new window
      bind -n M-c kill-pane       # Alt+c = close pane
      bind -n M-q kill-window     # Alt+q = close window
      bind -n M-Q kill-session    # Alt+Q = close session
    '';
    plugins = with pkgs; [
      tmuxPlugins.gruvbox  # Keeping your gruvbox theme
      # {
      #   plugin = tmuxPlugins.resurrect;
      #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";  # Save nvim sessions
      # }
      # {
      #   plugin = tmuxPlugins.continuum;
      #   extraConfig = ''
      #     set -g @continuum-restore 'on'        # Auto-restore on tmux start
      #     set -g @continuum-save-interval '60'  # Auto-save every 60 minutes
      #   '';
      # }
    ];
  };
}
