{ config, lib, pkgs, ... }:

{
  environment.gnome.excludePackages = with pkgs; [
    gnome-contacts
    gnome-maps
    simple-scan
    totem
    snapshot
    gnome-connections
    evince
    gnome-font-viewer
    seahorse
    baobab
    gnome-logs
    gnome-tour
    geary
    orca
    gnome-music
    gnome-system-monitor
    gnome-online-accounts
    gnome-browser-connector
    gnome-characters
  ];
}

