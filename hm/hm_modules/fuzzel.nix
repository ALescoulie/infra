{ config, pkgs, lib, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      colors = {
        background = "1e1e2e00";
        text= "cdd6f4ff";
        selection = "585b70ff";
        selection-match = "b4befeff";
        selection-text = "cdd6f4ff";
        border = "b4befeff";
      };
    };
  };
}

