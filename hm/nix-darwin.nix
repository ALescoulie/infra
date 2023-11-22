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
  home.stateVersion = "23.05";

  imports = [
    ./hm_modules/nvim/nvim.nix
  ];

  home.packages = with pkgs; [
    poetry
    cargo
    neofetch
  ];

  programs.zsh.enable = true;

}
