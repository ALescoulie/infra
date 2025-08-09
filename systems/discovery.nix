{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./sys_modules/devtool-utils.nix
      ./sys_modules/hardware-config.nix
      ./sys_modules/terminal-utils.nix
      ./sys_modules/open-ssh.nix
      ./sys_modules/dev_machines.nix
      ./sys_modules/fcitx5-config.nix
      ./sys_modules/printer-config.nix
      ./sys_modules/localization-config.nix
      ./sys_modules/boot-config.nix
      ./sys_modules/alia-config.nix
      ./sys_modules/xserver-config.nix
      ./sys_modules/audio-config.nix
      ./sys_modules/nixpkgs-config.nix
      ./sys_modules/open-ssh.nix
    ];

  networking.networkmanager.enable = true;
  
  # For flashing keyoard
  services.udev.packages = [ pkgs.qmk-udev-rules ];

  networking.hostName = "Discovery";

  fileSystems."/media" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  
  fileSystems."/games" = {
    device = "/dev/sdb1";
    fsType = "ext4";
  };

  programs.hyprland = {
    enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment = {
    variables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  security.rtkit.enable = true;

  programs.steam.enable = true;

  system.stateVersion = "24.11"; 

  # Enable flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

}

