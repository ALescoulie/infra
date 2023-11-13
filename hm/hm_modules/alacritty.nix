{ config, pkgs, lib, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        title = "Terminal";
        opacity = 0.5;
        dynamic_title = true;
      };
      selection = {
        save_to_clipboard = true;
      };
      colors = {      
        primary = {
          background = "0x1b182c";
          foreground = "0xaaffe4";
        };

        normal = {
          black = "0x100e23"
          red =     "0xff8080";
          green =   "0x95ffa4";
          yellow =  "0xffe9aa";
          blue =    "0x91ddff";
          magenta = "0xc991e1";
          cyan =    "0xaaffe4";
          white =   "0xcbe3e7";
        };

        bright = {
          black = "0x565577";
          red = "0xff545a";
          green = "0x62d198";
          yellow = "0xffb37a";
          blue = "0x65b300";
          magenta = "0x906d00";
          cyan = "0x63f2f3";
          white = "0xa6b3cd";
        };  
        cursor = {
          text = "0xc991e1";
          cursor = "0xc991e1";
        };
      };
      cursor = {
        style = {
          shape = "Beam";
        };
        blinking = "On";
        vi_mode_style = "Beam";
        blilnk_interval = 750;
        blink_timeout = 5;
        unfocused_hollow = true;
      };
    };
  };
}

