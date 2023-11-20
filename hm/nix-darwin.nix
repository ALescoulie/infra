{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  users.users.eve = {
    name = "alia";
    home = "Users/alia";
  };

  home.stateVersion = "23.05";

  imports = [
    ./hm_modules/nvim
  ];

  home.packages = with pkgs; [
    poetry
    anki
    cargo
    neofetch
  ];

  programs.zsh.enable = true;

}
