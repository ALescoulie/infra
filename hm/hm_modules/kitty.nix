{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Adwaita dark";
    extraConfig = ''
      font_size 10

      background_opacity 0.5
    '';
  };
}

