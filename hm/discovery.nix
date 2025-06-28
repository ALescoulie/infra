{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  home.username = "alia";
  home.homeDirectory = "/home/alia";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    ./hm_modules/direnv.nix
    ./hm_modules/hypr-nvidia.nix
    ./hm_modules/waybar/waybar.nix
    ./hm_modules/zsh/zsh.nix
    ./hm_modules/tmux.nix
    ./hm_modules/kitty.nix
    ./hm_modules/fuzzel.nix
  ];

  home.packages = with pkgs; [
    arandr
    anki
    zotero
    calibre
    discord
    nitrogen
    polybar
    cargo
    zulu
    prismlauncher
    deluge
    strawberry
    zathura
    sidequest
    ardour
    bambu-studio
  ];

}
