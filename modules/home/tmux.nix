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
      
			# Ayu Dark inspired status bar (simple)
			set -g status-bg '#0f1419'           # Dark background
			set -g status-fg '#bfbab0'           # Light foreground
			set -g status-interval 1
			set -g status-right '#[fg=#ffb454] %d/%m #[fg=#59c2ff] %H:%M:%S '
			set -g status-right-length 30
			
			# Simple pane borders
			set -g pane-border-style 'fg=#323842'
			set -g pane-active-border-style 'fg=#ffb454'
			
			# ===== WINDOW/TAB MANAGEMENT =====
			# Alt+c = Create new window (like new tab)
			bind -n M-c new-window
			
			# Alt+number = Switch to window number
			bind -n M-1 select-window -t 1
			bind -n M-2 select-window -t 2
			bind -n M-3 select-window -t 3
			bind -n M-4 select-window -t 4
			bind -n M-5 select-window -t 5
			
			# Alt+n/p = Next/Previous window
			bind -n M-n next-window
			bind -n M-p previous-window
			
			# ===== PANE SPLITTING (Perfect for side-by-side preview!) =====
			# Alt+v = Split vertically (side by side) - PERFECT for markdown + preview
			bind -n M-v split-window -h
			
			# Alt+s = Split horizontally (top/bottom)
			bind -n M-s split-window -v
			
			# ===== VIM-STYLE PANE NAVIGATION =====
			# Alt+hjkl = Move between panes (vim style)
			bind -n M-h select-pane -L    # Go left
			bind -n M-j select-pane -D    # Go down  
			bind -n M-k select-pane -U    # Go up
			bind -n M-l select-pane -R    # Go right
			
			# ===== VIM-STYLE PANE RESIZING =====
			# Alt+Shift+hjkl = Resize panes
			bind -n M-H resize-pane -L 5   # Shrink left
			bind -n M-J resize-pane -D 3   # Shrink down
			bind -n M-K resize-pane -U 3   # Shrink up  
			bind -n M-L resize-pane -R 5   # Shrink right
			
			# ===== QUICK ACTIONS =====
			# Alt+x = Close current pane
			bind -n M-x kill-pane
			
			# Alt+r = Reload config
			bind -n M-r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
		'';
		plugins = with pkgs; [
			# Keep it simple for now
		];
	};
}
