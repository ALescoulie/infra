{ config, pkgs, lib, ... }:

{
  services.polybar = {
    enable = true;
    config = ./polybar.ini;
    script = ''
      polybar top &
    ''
  };
}
