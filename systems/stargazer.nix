
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
    ];

  nixpkgs.config.allowBroken = true;

  # For flashing keyoard
  services.udev.packages = [ pkgs.qmk-udev-rules ];

  networking.hostName = "Stargazer"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;


  programs.hyprland = {
    enable = true;
  };

  programs.ssh.startAgent = true;
  programs.zsh.enable = true;
  users.users.alia.useDefaultShell = true;
  users.defaultUserShell = pkgs.zsh;
  # Configure keymap in X11

  # Enable sound with pipewire.
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;

  # Configure home manager users

  #home-manager.users.alia = { pkgs, ...}:

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  system.stateVersion = "24.11"; 

  # Enable flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
