{ config, lib, pkgs, ... }:

with lib;

let
  launchpad = pkgs.buildFHSEnv {
    name = "devenv";
    targetPkgs = pkgs: with pkgs; [
      uv
      # fnm
      
      zlib
    ];
    runScript = "${pkgs.fish}/bin/fish";
  };
in {
  options.devWorkbench = {
    enable = mkEnableOption "Enable my nixos development environment";

    portal = mkOption {
      type = types.package;
      default = null;
      description = "My nixos development environment";
    };
  };

  config = mkIf config.devWorkbench.enable {
    devWorkbench.portal = launchpad;
  };
}

