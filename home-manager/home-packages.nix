{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    btop
    bat
    firefox
    vscode
    yazi
    spotify-player
    hyprpicker
    ];
}
