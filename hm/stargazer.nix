{ config, pkgs, lib, hyprland, ... }:

{
  
  programs.home-manager.enable = true;


  home.username = "alia";
  home.homeDirectory = "/home/alia";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    ./hm_modules/direnv.nix
    ./hm_modules/zsh/zsh.nix
    ./hm_modules/tmux.nix
    ./hm_modules/hypr.nix
    ./hm_modules/waybar/waybar.nix
    ./hm_modules/kitty.nix
  ];

  home.packages = with pkgs; [
    arandr
    anki
    arduino
    calibre
    discord
    polybar
    cargo
    prismlauncher
    deluge
    strawberry
    zathura
    praat
    zotero
  ];


}
