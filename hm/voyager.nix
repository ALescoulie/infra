{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.username = "alia";
  home.homeDirectory = /Users/alia;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);


  home.packages = with pkgs; [
    poetry
    cargo
    neofetch
    tmux
    iterm2
  ];

  programs.zsh.enable = true;

}
