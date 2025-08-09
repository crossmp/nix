{ username, hostname, pkgs, ... }:

{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.11";

  imports = [
    ./zsh.nix # <- hostname
    ./nixvim.nix
  ];

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;  
  home.packages = with pkgs; [
    neofetch
  ];
}
