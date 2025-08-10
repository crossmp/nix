{ homeStateVersion, user, ... }: {

  imports = [
    ./home-packages.nix
    ../../home-manager/modules/hyprland
    ../../home-manager/modules/waybar
    ../../home-manager/modules/wofi
    ../../home-manager/modules/git.nix
    ../../home-manager/modules/nixvim.nix
    ../../home-manager/modules/tmux.nix
    ../../home-manager/modules/zsh.nix
    ../../home-manager/modules/alacritty.nix
    ../../home-manager/modules/bat.nix
    ../../home-manager/modules/shell.nix
    ../../home-manager/modules/stylix.nix
    ../../home-manager/modules/swaync.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}
