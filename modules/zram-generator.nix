{ config, lib, pkgs, ... }:

{
  services.zram-generator = {
    enable = true;
    settings = {
      zram0 = {
        zram-size = "ram";
        compression-algorithm = "zstd";
      };
    };
  };
}

