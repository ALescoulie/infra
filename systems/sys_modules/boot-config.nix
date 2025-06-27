{pkgs, ...}:

{
  boot.supportedFilesystems = [ "ntfs" ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
    devices = ["nodev"];
  };
  
  boot.loader.efi.canTouchEfiVariables = true;
}

