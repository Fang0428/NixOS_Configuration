{ config, lib, pkgs, ... }:

{
  hardware = {
    nvidia-container-toolkit.enable = true;
    cpu.intel.updateMicrocode = true;
    trackpoint = {
      device = "TPPS/2 Elan TrackPoint";
      enable = true;
      speed = 240;
      sensitivity = 255;
    };
    # opentabletdriver.enable = true;
    graphics.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          FastConnectable = true;
          Privacy = "device";
        };
      };
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      open = true;
      nvidiaSettings = false;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
          offloadCmdMainProgram = "nvrun";
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
    graphics.extraPackages = with pkgs; [
      intel-media-driver
      nvidia-vaapi-driver
      libva-vdpau-driver
      libvdpau
      libvdpau-va-gl
      libva
      intel-compute-runtime-legacy1
    ];
  };
}

