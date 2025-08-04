{ config, lib, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix
      ./disk-config.nix
      ./local-packages.nix
      ../../nixos/modules
    ];  

  environment.systemPackages = [ pkgs.home-manager ];
  
  networking.hostName = "nixos-laptop"; # Define your hostname.

  # Enable the OpenSSH daemon.###########
  services.openssh.enable = true;
  #######################################


  system.stateVersion = "25.05";

}

