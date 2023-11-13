{ config, pkgs, lib, ... }:

{
  services.polybar = {
    enable = true;
    config = ./polybar.ini;
		script = ''
		'';
  };

  home.file = {
    ".config/i3/launch_polybar.sh" = { source = ./launch_polybar.sh; };
		".config/i3/config" = { source = ./config; };
  };
}
