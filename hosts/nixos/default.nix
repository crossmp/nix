{ stateVersion, hostname, pkgs, user, ... }: {
  
  imports =
    [ 
      ./local-packages.nix
      ../../nixos/modules/env.nix
      ../../nixos/modules/home-manager.nix
      ../../nixos/modules/nix.nix
      ../../nixos/modules/user.nix
    ];  

  wsl = {
    enable = true;
    defaultUser = user;
    useWindowsDriver = true;
  };

  environment.systemPackages = [ pkgs.home-manager ];
  
  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}

