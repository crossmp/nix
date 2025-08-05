{ homeStateVersion, user, ... }: {

  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
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
