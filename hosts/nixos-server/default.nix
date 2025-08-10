{ stateVersion, hostname, pkgs, ... }: {
  
  imports =
    [ ./hardware-configuration.nix
      ./disk-config.nix
      ./local-packages.nix
      ../../nixos/modules/audio.nix
      ../../nixos/modules/boot.nix
      ../../nixos/modules/env.nix
      ../../nixos/modules/home-manager.nix
      ../../nixos/modules/kernel.nix
      ../../nixos/modules/locale.nix
      ../../nixos/modules/net.nix
      ../../nixos/modules/nix.nix
      ../../nixos/modules/ssh.nix
      ../../nixos/modules/user.nix
      ];  

  environment.systemPackages = [ pkgs.home-manager ];
  
  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}

