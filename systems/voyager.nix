# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = 
  [
    ./sys_modules/devtools-utils.nix
    ./sys_modules/terminal-utils/nix
  ];

  let 
    configuration = { pkgs, ... }: {
      nix.settings.experimental-features = "nix-commands flakes"
      
    };

 }
