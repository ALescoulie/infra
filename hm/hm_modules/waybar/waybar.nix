{ config, pkgs, lib, ... }:

{
  # Based on https://github.com/DN-debug/waybar-examples/blob/main/waybar-examples/sway/config-sway
  programs.waybar = {
    enable = true;
    style = ''
       ${builtins.readFile ./styles.css}


      * {
          border: none;
          border-radius: 0px;
          font-family: Roboto, Helvetica, Arial, sans-serif;
          min-height: 0;
          font-size: 12px;
        }
    '';

    settings = [{
      layer = "top";
      height = 20;
      position = "top";
      margin-top = 2;
      margin-bottom = 2;

      modules-left = [
        "custom/launcher"
      ];

      modules-center = [
        "hyprland/workspaces"
      ];

      modules-right = [
        "idle_inhibitor"
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "temperature"
        "battery"
        "battery#bat2"
        "tray"
        "clock"
        "custom/power"
      ];

      # Modules configuration 

      "hyprland/workspaces" = {
        disable-scrool = true;
        all-outputs = false;
        format = "{name}";
      };

      keyboard-state = {
        numlock = true;
        capslock = true;
        format = " {name} {icon}";
        format-icons = {
          locked = "";
          unlocked =  "";
        };
      };

      "wayland/mode" = {
        format = "<span style=\"italic\">{}</span>";
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated =  "";
          deactivated = "";
        };
      };

      tray = {
        icon-size = 15;
        spacing = 5;
      };

      clock = {
        format-alt = "{:%Y-%m-%d}";
        tooltip-format = "{:%Y-%m-%d | %H:%M}";
      };

      cpu = {
        format = "{usage}% ";
        tooltip =  false;
      };

      memory = {
        format = "{}% ";
      };

      temperature = {
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" ];
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };

        format = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = [ ""  "" "" "" "" ];
      };

      "battery#bat2" = {
        bat = "BAT2";
      };

      network = {
        #interface = "wlp2*"; #(Optional) To force the use of this interface
        format-wifi = "";
        format-ethernet = "";
        tooltip-format = "{essid} ({signalStrength}%) {ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };

      pulseaudio = {
        #"scroll-step" = 1, // %, can be a float
        format = "{icon}";
        format-bluetooth = "{icon}";
        format-bluetooth-muted = "{icon}";
        format-muted = "";
        format-source = "󰖁";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "󰸈" "󰕾" "󰕾" ];
        };
        on-click = "pavucontrol";
      };

      "custom/launcher" = {
        format = "󱄅";
        on-click = "fuzzel";
        on-click-right = "killall fuzzel";
      };
        
      "custom/power" = {
        format = "󰐥";
        on-click = "bash ${builtins.toString ./fuzzel-powermenu.sh}";
        on-click-right = "killall fuzzel";
      };
    }];
  };
}

