{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "bind = $mainMod, 28, exec, alacritty"
      ];
    };
  };   
}
