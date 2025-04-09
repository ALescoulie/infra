{pkgs, ...}

{
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "altgr-intl";
    displayManager = {
        sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "hyprland";
    };
    desktopManager.plasma6.enable = true;
  };
}
