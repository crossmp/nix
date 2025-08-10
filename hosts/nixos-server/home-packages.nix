{ pkgs, hostname, ... }: 
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    git
    btop
    bat
    neovim
  ];
}
