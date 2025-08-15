{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nixup = "sudo nixos-rebuild switch";
      nixclean = "sudo nix-collect-garbage --delete-older-than 7d";
    };
  };
}

