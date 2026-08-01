{pkgs, ...}:

{
  services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "sway";
    };
  services.desktopManager.plasma6.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "altgr-intl";
  };
}
