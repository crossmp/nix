{ pkgs, inputs, ... }: {
  
  imports = [inputs.stylix.homeModules.stylix];

  # Fonts
  home.packages = with pkgs; [
    font-awesome
  ];
  #fonts.fontconfig.enable = true;  

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    targets = {
      neovim.enable = false;
      waybar.enable = false;
      wofi.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
    };

    cursor = {
      name = "DMZ-Black";
      size = 24;
      package = pkgs.vanilla-dmz;
    };

    image = ./../../wallpapers/garrett-parker-DlkF4-dbCOU.jpg;
  };
}
