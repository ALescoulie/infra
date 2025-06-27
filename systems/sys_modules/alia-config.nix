{pkgs, ...}:

{
  users.users.alia = {
    isNormalUser = true;
    description = "Alia Lescoulie";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "dialout" ];
    packages = with pkgs; [
      firefox
      qmk
      spice-gtk
      pavucontrol
    ];
  };
}

