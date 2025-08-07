{ pkgs, hostname, ... }: {
  boot.kernelPackages = 
    if hostname == "nixos-server" then 
      pkgs.linuxPackages
    else if hostname == "nixos-laptop" then
      pkgs.linuxPackages_zen
      #pkgs.linuxPackages_latest
    else
      pkgs.linuxPackages; # Fallback
}
