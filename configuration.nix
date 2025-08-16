{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      ./modules/fish.nix
      ./modules/dev_workbench.nix
      ./modules/ssh.nix
      ./modules/excludepkgs.nix
      ./modules/auto_cpufreq.nix
      ./modules/boot.nix
      ./modules/fonts.nix
      ./modules/git.nix
      ./modules/gnome_suspend.nix
      ./modules/hw_params.nix
      ./modules/i18n.nix
      ./modules/nix_params.nix
      ./modules/syspkgs.nix
      ./modules/thinkfan.nix
      ./modules/throttled.nix
      ./modules/user_fang.nix
      ./modules/zram-generator.nix
    ];
    
  fileSystems."/home/fang/.cache" = {
    fsType = "tmpfs";
    options = [ "size=8G" "mode=0700" "uid=1000" "gid=100" ];
  };
  
  devWorkbench.enable = true;
  
  systemd.oomd.enable = true;
  documentation.doc.enable = false;
  environment.defaultPackages = [];

  networking = {
    hostName = "ThinkPad_P1_Gen2";
    networkmanager.enable = true;
    nftables.enable = true;
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  time.timeZone = "Australia/Sydney";

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.gamemode.enable = true;
  programs.localsend.enable = true;
  programs.lazygit.enable = true;
  
  programs.firefox = {
    enable = true;
  };
  
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.starship = {
    enable = true;
    presets = [ "nerd-font-symbols" ];
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  qt = {
    enable = true;
    style = "adwaita-dark";
    platformTheme = "gnome";
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
  };

  security = {
    sudo.enable = false;
    sudo-rs.enable = true;
    polkit.enable = true;
    protectKernelImage = true;
    forcePageTableIsolation = true;
    virtualisation.flushL1DataCache = "always";
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.libinput.enable = true;
  services.fprintd.enable = true;
  services.irqbalance.enable = true;
  services.power-profiles-daemon.enable = false;
  services.fwupd.enable = true;
  services.switcherooControl.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.dbus = {
    implementation = "broker";
  };

  services.gnome = {
    gnome-settings-daemon.enable = true;
    gnome-keyring.enable = true;
  };

  services.aria2 = {
    enable = false;
    openPorts = true;
    rpcSecretFile = "/home/fang/.config/aria2/rpc-token.txt";
  };

  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
