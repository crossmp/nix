{ homeStateVersion, user, ... }: {

  imports = [
    ./home-packages.nix
    ../../home-manager/modules/git.nix
    ../../home-manager/modules/nixvim.nix
    ../../home-manager/modules/tmux.nix
    ../../home-manager/modules/zsh.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}
