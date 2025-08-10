{ config, lib, pkgs, ... }:

{
  home.file.".zprofile".text = ''
    # Start Hyprland only on laptop, and only on first TTY login
    if [ "$USER" = "matt" ] && [ "$HOSTNAME" = "nixos-laptop" ] && [ "$(tty)" = "/dev/tty1" ]; then
      if uwsm check may-start > /dev/null && uwsm select; then
        exec systemd-cat -t uwsm_start uwsm start default
      fi
    fi
  '';
}
