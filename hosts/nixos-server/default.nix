{ stateVersion, hostname, pkgs, ... }: {
  
  imports =
    [ ./hardware-configuration.nix
      ./disk-config.nix
      ./local-packages.nix
  ../../modules/nixos/audio.nix
  ../../modules/nixos/boot.nix
  ../../modules/nixos/env.nix
  ../../modules/nixos/home-manager.nix
  ../../modules/nixos/kernel.nix
  ../../modules/nixos/locale.nix
  ../../modules/nixos/net.nix
  ../../modules/nixos/nix.nix
  ../../modules/nixos/ssh.nix
  ../../modules/nixos/user.nix
      ];  

  environment.systemPackages = [ pkgs.home-manager ];
  
  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}

