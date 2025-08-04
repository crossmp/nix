{ config, pkgs, ... }:

{
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = "matt";
    homeDirectory = "/home/matt";
    stateVersion = "25.05";
  };

  # Consider moving all below later
  # nvidia vaapi environment variables
  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    MOZ_DISABLE_RDD_SANDBOX = "1"; # Potentially needed for Firefox
  };

  #programs.dunst = {
  #  enable = true;
  #};

}
