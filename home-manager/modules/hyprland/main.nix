{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    #package = null;
    #portalPackage = null;
    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/screens"
        # NVIDIA specific environment variables
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NVD_BACKEND,direct"
        #"WLR_NO_HARDWARE_CURSORS,1"
        #"GBM_BACKEND,nvidia-drm"
      ];

      # Variables
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$browser" = "firefox";
      #"$fileManager" = "nautilus";
      "$menu" = "wofi";

      # Monitors
      monitor = [
        "eDP-1,1920x1080@60.00Hz,0x0,1"
      ];

      exec-once = [
        "waybar"
      ];
            
      general = {
        gaps_in = 1;
        gaps_out = 2;
        border_size = 2;
      };

      animations = {
        enabled = false;
      #  #duration = 0.1;
      };

      input = {
        kb_layout = "us";             # Force US keyboard layout
        kb_variant = "";              # No variant
        kb_model = "";                # Auto-detect keyboard model
        kb_options = "";              # No special options
        kb_rules = "";                # No special rules
        
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
        
        sensitivity = 0;              # -1.0 - 1.0, 0 means no modification
      };
    };
  };
}
