{
  services.tlp = {
    enable = true;
    settings = {
      # COPIED IN WORK ON THESE 
      # General Power Settings
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      # Runtime Power Management
      RUNTIME_PM_ON_BAT = "auto";

      # Sound card power saving
      SOUND_POWER_SAVE_ON_BAT = 1;

      # Disk
      DISK_IDLE_SECS_ON_BAT = 2;
      SATA_LINKPWR_ON_BAT = "min_power";

      # USB
      USB_AUTOSUSPEND = 1;

      # Wi-Fi power save mode
      WIFI_PWR_ON_BAT = 1;

      # Battery thresholds (not always supported)
      START_CHARGE_THRESH_BAT0 = 60;
      STOP_CHARGE_THRESH_BAT0 = 60;
    };
  };
}
