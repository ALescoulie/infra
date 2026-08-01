{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  home.username = "alia";
  home.homeDirectory = "/home/alia";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);
  home.stateVersion = "26.05"; # Please read the comment before changing.

  imports = [
    ./hm_modules/direnv.nix
    ./hm_modules/waybar/waybar.nix
    ./hm_modules/sway.nix
    ./hm_modules/zsh/zsh.nix
    ./hm_modules/tmux.nix
    ./hm_modules/kitty.nix
    ./hm_modules/fuzzel.nix
  ];

  home.packages = with pkgs; [
    arandr
    anki
    zotero
    obsidian
    calibre
    discord
    nitrogen
    polybar
    cargo
    jdk25
    deluge
    ckan
    strawberry
    zathura
    sidequest
    ardour
    ripgrep
    (openttd-jgrpp.overrideAttrs (oldAttrs: {
      src = fetchFromGitHub {
        owner = "JGRennison";
        repo = "OpenTTD-patches";
        rev = "jgrpp-0.69.2";
        sha256 = "sha256-D9Oh05Isf7Atsih6tZBA8xS04aCuE8VS5Ghf0FvrU5A=";
      };
      version = "0.69.2";
      })) 
  ];

}
