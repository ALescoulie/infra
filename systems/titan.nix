# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nix-darwin, ... }:

{
  imports = 
  [
    ./sys_modules/devtool-utils.nix
    ./sys_modules/aerospace.nix
  ];

  users.users.alia = {
    name = "alia";
    home = "/Users/alia";
  };

  system.primaryUser = "alia";

  # Enable flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    dock.autohide = true;
    dock.show-recents = false;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "Nlsv"; # list view
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.InitialKeyRepeat = 15;
    NSGlobalDomain."com.apple.mouse.tapBehavior" = 1; # tap to click
  };
  

  environment.systemPackages = with pkgs; [
    neovim
    tmux
    tree
    wget
    curl
    fastfetch
    sl
    htop
  ];

  homebrew.enable = true;

  homebrew.casks = ["vorssaint"];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.alia = import ../hm/titan.nix;

  nix.gc = {
    automatic = true;
    interval = { Weekday = 0; Hour = 3; Minute = 0; };
    options = "--delete-older-than 30d";
  };
  
  nix.optimise.automatic = true;

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
}
 
