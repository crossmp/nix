{ hostname, ... }: {
  boot.loader = if hostname == "nixos-server" then {
    # Legacy/GRUB boot for older server hardware
    grub = {
      enable = true;
      device = "/dev/sda";  # Install GRUB to MBR
    };
  } else {
    # UEFI/systemd-boot for laptop
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}