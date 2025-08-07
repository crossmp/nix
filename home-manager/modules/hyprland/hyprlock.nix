{ config, pkgs, user, ... }: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        grace = 10;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot"; # Blur screen contents at time of lock
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      label = [
        {
          text = "$TIME";
          font_size = 72;
          font_family = "JetBrainsMono Nerd Font";
          color = "rgba(235, 219, 178, 1.0)";
          position = "0, -120";
          halign = "center";
          walign = "center";
          shadow_passes = 2;
        }
      ];

      input-field = [
        {
          size = "250, 60";
          position = "0, 100";
          dots_center = true;
          font_color = "rgb(235, 219, 178)";
          inner_color = "rgba(40, 40, 40, 0.6)";
          outer_color = "rgba(60, 56, 54, 0.9)";
          outline_thickness = 4;
          shadow_passes = 1;
        }
      ];
    };
  };
}
