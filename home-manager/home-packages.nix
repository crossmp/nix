{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    btop
    bat
    firefox
    vscode
    yazi

    spotify-player

    #cliphist
    #wl-clipboard

    wev
    brightnessctl

    hyprpicker
    grimblast
  ];
}
