{pkgs, ...}:

{

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
