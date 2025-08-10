{ pkgs, hostname, ... }: 
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    git
    btop
    bat
    firefox
    vscode
    yazi
    spotify-player
    wev
    brightnessctl
    hyprpicker
    grimblast
  ];
}
