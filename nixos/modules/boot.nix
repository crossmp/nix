{ hostname, ... }: {
  boot.loader = {
    # UEFI/systemd-boot for laptop ####
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}