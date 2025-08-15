{ config, lib, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      nerd-fonts.fira-code
      nerd-fonts.monaspace
    ];

    fontconfig = {
      subpixel = {
        rgba = "rgb";
      };
      
      hinting = {
        style = "slight";
        autohint = true;
      };
      
      defaultFonts = {
        serif = [ "Noto Serif CJK SC" ];
        sansSerif = [ "Noto Sans CJK SC" ];
        monospace = [ "Noto Sans Mono CJK SC" ];
      };
    };
  };
}

