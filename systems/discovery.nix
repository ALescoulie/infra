# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

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
    ];

  networking.networkmanager.enable = true;
  
  # For flashing keyoard
  services.udev.packages = [ pkgs.qmk-udev-rules ];

  networking.hostName = "Discovery"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


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

  # Configure keymap in X11

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  services.xserver.videoDrivers = [ "nvidia" ];


  environment = {
    variables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };


  # Enable sound with pipewire.
  #sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  programs.steam.enable = true;

  system.stateVersion = "24.11"; 

  # Enable flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}

