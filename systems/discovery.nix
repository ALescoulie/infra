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
    ];

  boot.supportedFilesystems = [ "ntfs" ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
    devices = ["nodev"];
    extraEntries = ''
      menuentry "WindOwOs" {
        search --set=win --fs-uuid 584A79304A790C4E
        chainloader ($win)+1
      }
    '';
 
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # For flashing keyoard
  services.udev.packages = [ pkgs.qmk-udev-rules ];

  networking.hostName = "Discovery"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons
      fcitx5-gtk
      libsForQt5.fcitx5-qt
    ];
};

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.deepin.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.picom.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "altgr-intl";
  };

  services.xserver.videoDrivers = ["nvidia"];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alia = {
    isNormalUser = true;
    description = "Alia Lescoulie";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      qmk
      qutebrowser-qt6
    #  thunderbird
    ];
  };

  # Configure home manager users

  #home-manager.users.alia = { pkgs, ...}:

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  programs.steam.enable = true;

  system.stateVersion = "24.05"; 

  # Enable flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
