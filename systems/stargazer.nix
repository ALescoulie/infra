{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./sys_modules/stargazer-hardware-config.nix
      ./sys_modules/devtool-utils.nix
      ./sys_modules/terminal-utils.nix
      ./sys_modules/open-ssh.nix
      ./sys_modules/dev_machines.nix
      ./sys_modules/virtualization.nix
      ./sys_modules/fcitx5-config.nix
      ./sys_modules/printer-config.nix
      ./sys_modules/localization-config.nix
      ./sys_modules/boot-config.nix
      ./sys_modules/alia-config.nix
      ./sys_modules/xserver-config.nix
      ./sys_modules/bluetooth-config.nix
      ./sys_modules/audio-config.nix
    ];



  networking.hostName = "Stargazer";

  # Enable networking
  networking.networkmanager.enable = true;


  programs.hyprland = {
    enable = true;
  };

  security.rtkit.enable = true;

  system.stateVersion = "24.11"; 

  # Enable flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
