{ pkgs, inputs, ... }: {
  
  imports = [inputs.stylix.homeManagerModules.stylix];

  # Fonts
  home.packages = with pkgs; [
    font-awesome
  ];
  #fonts.fontconfig.enable = true;  

  stylix = {
    enable = true;

    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    
    #colorschemes.catppuccin.enable = true;
    #plugins.lualine.enable = true;
  };
}
