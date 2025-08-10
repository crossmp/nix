{ homeStateVersion, user, ... }: {

  imports = [
    ./home-packages.nix
    ../../modules/home/hyprland
    ../../modules/home/waybar
    ../../modules/home/wofi
    ../../modules/home/git.nix
    ../../modules/home/nixvim.nix
    ../../modules/home/tmux.nix
    ../../modules/home/shell.nix
    ../../modules/home/alacritty.nix
    ../../modules/home/bat.nix
    ../../modules/home/stylix.nix
    ../../modules/home/swaync.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}
