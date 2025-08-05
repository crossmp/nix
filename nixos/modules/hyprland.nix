{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  security.polkit.enable = true;
  security.pam.services.hyprlock = {};
}
