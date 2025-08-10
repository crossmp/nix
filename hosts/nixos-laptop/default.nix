{ stateVersion, hostname, pkgs, ... }: {
  
  imports =
    [ ./hardware-configuration.nix
      ./disk-config.nix
      ./local-packages.nix
  ../../modules/nixos/asus-laptop.nix
  ../../modules/nixos/audio.nix
  ../../modules/nixos/bluetooth.nix
  ../../modules/nixos/boot.nix
  ../../modules/nixos/env.nix
  ../../modules/nixos/home-manager.nix
  ../../modules/nixos/hyprland.nix
  ../../modules/nixos/kernel.nix
  ../../modules/nixos/locale.nix
  ../../modules/nixos/net.nix
  ../../modules/nixos/nix.nix
  ../../modules/nixos/nvidia.nix
  ../../modules/nixos/ssh.nix
  ../../modules/nixos/tlp.nix
  ../../modules/nixos/user.nix
  ../../modules/nixos/zram.nix
    ];  

  environment.systemPackages = [ pkgs.home-manager ];
  
  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}

