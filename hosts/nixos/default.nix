{ stateVersion, hostname, pkgs, user, ... }: {
  
  imports =
    [ 
      ./local-packages.nix
  ../../modules/nixos/env.nix
  ../../modules/nixos/home-manager.nix
  ../../modules/nixos/nix.nix
  ../../modules/nixos/user.nix
    ];  

  wsl = {
    enable = true;
    defaultUser = user;
    useWindowsDriver = true;
  };
  programs.nix-ld.enable = true;

  environment.systemPackages = [ pkgs.home-manager ];
  
  networking.hostName = hostname;

  system.stateVersion = stateVersion;
}

