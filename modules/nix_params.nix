{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.settings = {
    auto-optimise-store = true;
    download-buffer-size = 1073741824;
  };
}

