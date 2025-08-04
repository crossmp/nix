{ pkgs, ... }: {
  programs.tmux = {
  enable = true;
  clock24 = true;
  terminal = "screen-256color";
  extraConfig = ''
    set-option -g status on
    set-option -g status-position top
    set-option -g status-interval 5
    set-option -g status-left "#[fg=green]#H"
    set-option -g status-right "#[fg=yellow]%Y-%m-%d %H:%M"
  '';
  };
}