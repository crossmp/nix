{ stateVersion, hostname, pkgs, ... }: {
  
  imports =
    [ ./hardware-configuration.nix
      ./disk-config.nix
      ./local-packages.nix
      ../../nixos/modules
    ];  

  environment.systemPackages = [ pkgs.home-manager ];
  
  networking.hostName = hostname;

  # Enable the OpenSSH daemon.###########
  services.openssh.enable = true;
  #######################################

  system.stateVersion = stateVersion;
}

