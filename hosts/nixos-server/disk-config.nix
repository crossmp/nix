{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";  # Simplified - just use /dev/sda
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "512M";  # Smaller boot partition
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";  # Change to ext4
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}