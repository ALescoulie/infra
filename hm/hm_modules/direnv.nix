{ config, pkgs, lib, ... }:

{
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}

