{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    btop
    bat
    firefox
    vscode
    yazi
    #neovim

    # Fonts
    font-awesome
    ];
}
