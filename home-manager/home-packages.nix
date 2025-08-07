{ pkgs, hostname, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    git
    btop
    bat
  ] ++ (if hostname == "nixos-server" then [
    neovim
  ] else if hostname == "nixos-laptop" then [
    firefox
    vscode
    yazi
    spotify-player
    wev
    brightnessctl
    hyprpicker
    grimblast
  ] else []);
}
