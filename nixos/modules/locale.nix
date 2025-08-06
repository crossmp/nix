{ lib, ... }: {
  time.timeZone = "Pacific/Auckland";
  i18n.defaultLocale = "en_NZ.UTF-8";
  # Explicitly set console keyboard to US layout
  console = lib.mkForce {  
    font = "Lat2-Terminus16";
    keyMap = "us";                    # Force US keyboard layout
    useXkbConfig = true;              # Use xkb options in tty
  };
  # Set X11 keyboard layout (affects Wayland too)
  services.xserver.xkb = {
    layout = "us";                    # US layout
    variant = "";                     # No variant
    options = "";                     # No special options for now
  };
}
