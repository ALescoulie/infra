{ config, pkgs, lib, hyprland, ... }:

{
  
  programs.home-manager.enable = true;


  home.username = "alia";
  home.homeDirectory = "/home/alia";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [
    ./hm_modules/alacritty.nix
    ./hm_modules/direnv.nix
    ./hm_modules/polybar/polybar.nix
    ./hm_modules/nvim/nvim.nix
    ./hm_modules/zsh/zsh.nix
    ./hm_modules/tmux.nix
    ./hm_modules/hypr.nix
    ./hm_modules/waybar/waybar.nix
  ];

  home.packages = with pkgs; [
    arandr
    anki
    calibre
    discord
    polybar
    cargo
    prismlauncher
    deluge
    strawberry
    zathura
  ];


}
