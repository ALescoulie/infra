{ config, pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 13;
    };
    theme = "Adwaita dark";
    extraConfig = ''
      font_size 18

      background_opacity 0.5
    '';
  };
}

