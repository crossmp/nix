{ config, ... }: {
  programs.bash = {
    enable = true;
    initExtra = ''
      #if uwsm checl may-start > /dev/null && uwsm select; then
      #  exec systemd-cat -t uwsm_start uwsm start default
      #fi
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop      
      fi
    '';
    shellAliases = {
      test = "echo alias works";
    };
  };
}
