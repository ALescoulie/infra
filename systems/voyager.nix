# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nix-darwin, ... }:

{
  imports = 
  [
    ./sys_modules/devtool-utils.nix
  ];

  # Enable flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
 
