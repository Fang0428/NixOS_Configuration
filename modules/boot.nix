{ config, lib, pkgs, ... }:

{
 # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
      grub.enable = false;
    };
    
    blacklistedKernelModules = [ "nouveau" ];
    
    extraModprobeConfig = ''
      options psmouse synaptics_intertouch=0
      options thinkpad_acpi experimental=1 fan_control=1
      options nvidia NVreg_EnablePCIeGen3=1
      options nvidia NVreg_PreserveVideoMemoryAllocations=1
      options nvidia NVreg_UsePageAttributeTable=1
      options usbhid mousepoll=1
      options psmouse rate=200
    '';
    
    initrd = {
      kernelModules = [
        "i915"
        "nvme"
      ];
      
      verbose = false;
    };
    
    kernelModules = [
      "thinkpad_acpi"
      "coretemp"
      "battery"
      "ac"
      "ntsync"
    ];
    
    consoleLogLevel = 0;
    
    kernelParams = [
      "quiet"
      "splash"
      "nowatchdog"
      "vt.global_cursor_default=0"
      "loglevel=3"
      "systemd.show_status=auto"
      "udev.log_level=3"
      "acpi_osi="
      ''acpi_osi="Windows 2022"''
      "acpi_backlight=native"
      "video.use_native_backlight=1"
    ];
    
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    plymouth.enable = true;
    tmp.useTmpfs = true;
  };
}

