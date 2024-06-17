{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mainMod, 28, exec, alacritty"
    ];
  };   
}
