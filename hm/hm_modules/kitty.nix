{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Adwaita dark";
    extraConfig = ''
      font_size 18

      background_opacity 0.5
    '';
  };
}

