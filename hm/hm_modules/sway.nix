{ config, pkgs, lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
        {command = "waybar";}
      ];
      
      window = {
        titlebar = false;
      };

      output = {
        "DP-1" = {
          pos = "3840 0";
          bg = (builtins.toString ./wallpapers/jw_wp3.jpg) + " fill";
        };
        "HDMI-A-1" = {
          pos = "0 0";
          bg = (builtins.toString ./wallpapers/jw_wp2.png) + " fill";
        };
      };
      bars = [ ];
    };
  };
}

