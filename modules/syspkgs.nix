{ config, lib, pkgs, ... }:

{
  environment.systemPackages =
    (with pkgs; [
      qemu
      quickemu
      adw-gtk3
      devbox
      ratarmount
      papirus-icon-theme
      bibata-cursors
      resources
      refine
      gnome-firmware
      fastfetch
      bat
      tree
      wget
    ])
    ++ (with pkgs.gnomeExtensions; [
      kimpanel
      blur-my-shell
      clipboard-indicator
      caffeine
      dash-to-dock
      removable-drive-menu
      keep-pinned-apps-in-appgrid
      bluetooth-battery-meter
      status-area-horizontal-spacing
      gamemode-shell-extension
      touchpad-switcher
      touchpad-gesture-customization
      auto-accent-colour
      junk-notification-cleaner
      compiz-windows-effect
      compiz-alike-magic-lamp-effect
      wtmb-window-thumbnails
      ddterm
      desktop-cube
      coverflow-alt-tab
      appindicator
      tiling-shell
      wallpaper-slideshow
    ]);
}

