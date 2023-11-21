{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "powerlevel10k"
      ];
      
      #theme = "gnzh"
    };
  };
}

