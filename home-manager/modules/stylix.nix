{ pkgs, inputs, ... }: {
  
  imports = [inputs.stylix.homeManagerModules.stylix];

  # Fonts
  home.packages = with pkgs; [
    font-awesome
  ];
  #fonts.fontconfig.enable = true;  

  stylix = {
    enable = true;
    
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}