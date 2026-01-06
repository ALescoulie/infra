{pkgs, ...}:

{
  users.users.doug = {
    isNormalUser = true;
    description = "Doug";
    extraGroups = [ "networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
      qmk
      spice-gtk
      pavucontrol
      steam
    ];
  };
}

