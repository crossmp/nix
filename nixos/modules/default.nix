{ hostname, ... }: {
  imports = [
    ./boot.nix
    ./kernel.nix
    ./home-manager.nix
    ./locale.nix
    ./user.nix
    ./nix.nix
    ./ssh.nix
  ] ++ (if hostname == "nixos-server" then [

  ] else if hostname == "nixos-laptop" then [
    ./audio.nix
    ./hyprland.nix
    ./net.nix
    ./env.nix
    ./zram.nix
    ./nvidia.nix
    ./asus-laptop.nix
    ./bluetooth.nix
    ./tlp.nix
  ] else []);
}
