{ hostname, ... }: {
  imports = [
    ./git.nix
    ./bat.nix
  ] ++ (if hostname == "nixos-server" then [
    ./server.nix
  ] else if hostname == "nixos-laptop" then [
    ./shell.nix
    ./hyprland
    ./wofi
    ./alacritty.nix
    ./waybar
    ./tmux.nix
    ./nixvim.nix
    ./stylix.nix
    ./swaync.nix
  ] else []);
}
