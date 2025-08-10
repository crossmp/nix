{ hostname, ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Keep only the last 5 generations in the boot menu
  boot.loader.systemd-boot.configurationLimit = 5;
}
