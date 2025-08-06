{
  boot.loader.systemd-boot.enable = true; 
  boot.loader.efi.canTouchEfiVariables = true;

  # FIXING HOTKEYS
  boot.kernelParams = [
    "atkbd.softraw=1"          # Raw mode - no translation
    "atkbd.reset=1"            # Reset on boot
    "i8042.noloop=1"           # Disable loopback
    "i8042.nomux=1"            # Disable MUX
    "i8042.nopnp=1"            # Ignore PnP
    "acpi_osi=!"               # Disable ACPI OS interface
    "acpi_osi=\"Windows 2009\"" # Pretend to be old Windows
  ];
  # Stop ASUS from "helping"
  boot.blacklistedKernelModules = [
    "asus_nb_wmi"     # ASUS notebook WMI
    "asus_wmi"        # ASUS WMI hotkeys
  ];
}
