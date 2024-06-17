{ config, pkgs, lib, ... }:

{
  # Based on https://github.com/DN-debug/waybar-examples/blob/main/waybar-examples/sway/config-sway
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
       ${builtins.readFile ./styles.css}

      window#waybar {
        background: transparent;
        border-bottom: none;
      }

      * {
        ${if config.hostId == "Stargazer" then ''
        font-size: 18px;
      '' else ''

        ''}
      }
    '';

    settings [{
      layer = "top";
      height = 35;
      position = "top";
      margin-top = 5;
      margin-bottom = 10;
      
      modules-center = [
        "custom/launcher"
        "hyprland/workspaces"
        "idle_inhibitor"
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "temperature"
        "keyboard-state"
        "hyprland/language"
      ]
      ++ 
      (if config.hostId == "Stargazer" then [ "battery" "battery#bat2" ] else [ ])
      ++ [
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
          deactivated = ""
        };
      };

      tray = {
        icon-size = 20;
        spacing = 10;
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
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
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
        format-icons = ["", "", "", "", ""];
      };

      "battery#bat2" = {
        bat = "BAT2";
      };

      network = {
        interface = "wlp2*", // (Optional) To force the use of this interface
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "Connected  ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };

      pulseaudio = {
        #"scroll-step" = 1, // %, can be a float
        format = "{volume}% {icon}",
        format-bluetooth = "{volume}% {icon}",
        format-bluetooth-muted = "{icon} {format_source}",
        format-muted = "{format_source}",
        format-source = "",
        format-source-muted = "",
        format-icons = {
          headphone = "",
          hands-free = "",
          headset = "",
          phone = "",
          portable = "",
          car = "",
          default = ["", "", ""]
        };
        on-click = "pavucontrol";
      };

      "custom/launcher" = {
        format = "󱄅";
        on-click = "fuzzel";
        on-click-right = "killall fuzzel";
      };

      "custom/power" = {
        format = " ",
        on-click = "bash ${builtins.toString ./fuzzel-powermenu.sh}";
        on-click-right = "killall fuzzel"
      };


  }

