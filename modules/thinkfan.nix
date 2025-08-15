{ config, lib, pkgs, ... }:

{
  services.thinkfan = {
    enable = true;
    extraArgs = [ "-b" "0" ];
    sensors = [
      {
        type = "hwmon";
        query = "/sys/class/hwmon";
        name = "coretemp";
        indices = [ 1 ];
      }
      {
        type = "hwmon";
        query = "/sys/class/hwmon";
        name = "thinkpad";
        indices = [ 1 2 ];
      }
      {
        type = "hwmon";
        query = "/sys/class/hwmon";
        name = "acpitz";
        indices = [ 1 ];
      }
    ];
    levels = [
      [0     0      52]
      [1     50     57]
      [2     55     62]
      [3     60     67]
      [4     65     72]
      [5     70     77]
      [6     75     82]
      [7     80     87]
      [127   85     32767]
    ];
  };
}

