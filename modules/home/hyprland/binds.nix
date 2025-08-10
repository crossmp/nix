{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Hotkeys - Main
      "$mainMod, Q, exec, $terminal"
      "$mainMod, D, exec, $browser"
      #"$mainMod, E, exec, $fileManager"
      "$mainMod, R, exec, $menu --show drun"
      "$mainMod, C, killactive"
      "$mainMod, F, fullscreen"
      "$mainMod, V, togglefloating"
      "$mainMod SHIFT, C, exit"
      
      "$mainMod, P, exec, hyprpicker -an"
      "$mainMod, B, exec, pkill -SIGUSR2 waybar"      # Reload waybar
      "$mainMod SHIFT, B, exec, pkill -SIGUSR1 waybar" # Toggle waybar

      # BROKEN fn+F Keys
      "$mainMod SHIFT, S, exec, grimblast --notify --freeze copysave area"                   # Fn+F6 → screenshot
      #"$mainMod, P, exec, wdisplays"                                                        # Fn+F9 → display settings
      #"CTRL $mainMod, bracketright, exec, xinput disable 'ASUE1209:00 04F3:319B Touchpad'"  # Fn+F10 → disable touchpad
      # NOTE fn+F5 & fn+F12 are fully dead
      
      # Window Focus
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # Moving windows
      "$mainMod SHIFT, H,  swapwindow, l"
      "$mainMod SHIFT, J, swapwindow, r"
      "$mainMod SHIFT, K,    swapwindow, u"
      "$mainMod SHIFT, L,  swapwindow, d"

      # Resizeing windows                   X  Y
      "$mainMod CTRL, H,  resizeactive, -60 0"
      "$mainMod CTRL, J,  resizeactive,  0  60"
      "$mainMod CTRL, K,    resizeactive,  0 -60"
      "$mainMod CTRL, L, resizeactive,  60 0"

      # Switching workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Moving windows to workspaces
      #"$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      #"$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      #"$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      #"$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      #"$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      #"$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      #"$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      #"$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      #"$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      #"$mainMod SHIFT, 0, movetoworkspacesilent, 10"
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Example special workspace (scratchpad)
      "$mainMod, TAB, togglespecialworkspace, magic"
      "$mainMod SHIFT, TAB, movetoworkspace, special:magic"
      
      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      ", XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86MonBrightnessUp,   exec, brightnessctl -e4 -n2 set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ", XF86Launch3,           exec, rog-control-center" 
    ];
  };
}