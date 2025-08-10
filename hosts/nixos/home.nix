{ homeStateVersion, user, ... }: {

  imports = [
    ./home-packages.nix
  ../../modules/home/git.nix
  ../../modules/home/nixvim.nix
  ../../modules/home/tmux.nix
  ../../modules/home/zsh.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}
