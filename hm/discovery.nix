{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  home.username = "alia";
  home.homeDirectory = "/home/alia";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  imports = [
    ./hm_modules/alacritty.nix
    ./hm_modules/nvim.nix
    ./hm_modules/direnv.nix
  ];

  programs.bash.enable = true;

}
