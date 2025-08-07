{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "msdos";  # Use MBR instead of GPT
          partitions = {
            boot = {
              size = "1M";
              type = "ef02";  # BIOS boot partition
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}