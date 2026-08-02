{ config, pkgs, lib, ... }:

{
  # Based on https://github.com/DN-debug/waybar-examples/blob/main/waybar-examples/sway/config-sway
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    style = ''
       ${builtins.readFile ./styles.css}
    '';
    
    settings = [{
      # based on https://github.com/mxkrsv/dotfiles-old/blob/master/.config/waybar/config
      layer = "top";
      position = "top";
      height = 24;

      output = [
        "DP-1"
        "HDMI-A-1"
      ];

      modules-left = [
        "sway/mode"
		"sway/workspaces"
		"custom/arrow10"
		"sway/window"
      ];

      modules-right = [
		"custom/arrow9"
		"pulseaudio"
		"custom/arrow8"
		"network"
		"custom/arrow7"
		"memory"
		"custom/arrow6"
		"cpu"
		"custom/arrow5"
		"temperature"
		"custom/arrow4"
		"sway/language"
		"custom/arrow3"
		"custom/weather"
		"custom/arrow2"
		"tray"
		"clock#date"
		"custom/arrow1"
		"clock#time"
	  ];

      "custom/weather" = {
        format = " {}° ";
        tooltip = true;
        interval = 3600;
        exec = "${pkgs.wttrbar}/bin/wttrbar --fahrenheit --nerd";
        return-type = "json";
      };

      "battery" = {
        interval = 10;
        states = {
          warning = 30;
          critical = 15;
        };
        format-time = "{H}:{M:02}";
        format = "{icon} {capacity}% ({time})";
        format-charging = " {capacity}% ({time})";
        format-charging-full = " {capacity}%";
        format-full = "{icon} {capacity}%";
        format-alt = "{icon} {power}W";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        tooltip = false;
      };

      "clock#time" = {
        interval = 10;
        format = "{:%H:%M}";
        tooltip = false;
      };


      "clock#date" = {
        interval = 20;
        format = "{:%e %b %Y}";
        tooltip = false;
        #"tooltip-format" = "{:%e %B %Y}";
      };

      "cpu" = {
        interval = 5;
        tooltip = false;
        format = " {usage}%";
        format-alt = " {load}";
        states = {
          warning = 70;
          critical = 90;
        };
      };

      "sway/language" = {
        format = " {}";
        min-length = 5;
        on-click = "swaymsg 'input * xkb_switch_layout next'";
        tooltip = false;
      };

      "memory" = {
        interval = 5;
        format = "󰍛 {used:0.1f}G/{total:0.1f}G";
        states = {
          warning = 70;
          critical = 90;
        };
        tooltip = false;
      };

      "network" = {
        interval = 5;
        format-wifi = " {essid} ({signalStrength}%)";
        format-ethernet = "󰈀 {ifname}";
        format-disconnected = "󰈂 No connection";
        format-alt = " {ipaddr}/{cidr}";
        tooltip = false;
      };

      "sway/mode" = {
        format = "{}";
        tooltip = false;
      };

      "sway/window" = {
        format = "{}";
        max-length = 30;
        tooltip = false;
      };

      "sway/workspaces" = {
        disable-scroll-wraparound = true;
        smooth-scrolling-threshold = 4;
        enable-bar-scroll = true;
        format = "{name}";
      };

      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon} {volume}%";
        format-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" ""];
        };
        scroll-step = 1;
        on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        tooltip = false;
      };

      "temperature" = {
        critical-threshold = 90;
        interval = 5;
        format = "{icon} {temperatureC}°";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
        tooltip = false;
      };

      "tray" = {
        icon-size = 18;
        #"spacing" = 10
      };

      "custom/arrow1" = {
        format = "";
        tooltip = false;
      };

      "custom/arrow2" = {
        format = "";
        tooltip = false;
      };

      "custom/arrow3" = {
        format = "";
        tooltip = false;
      };

      "custom/arrow4" = {
        format = "";
        tooltip = false;
      };

      "custom/arrow5" = {
        format = "";
        tooltip = false;
      };

      "custom/arrow6" = {
        format = "";
        tooltip = false;
      };

      "custom/arrow7" = {
        format = "";
        tooltip = false;
      };

      "custom/arrow8" = {
        format = "";
        tooltip = false;
      };

      "custom/arrow9" = {
        format = "";
        tooltip = false;
      };

      "custom/arrow10" = {
        format = "";
        tooltip = false;
      };
    }];
  };
}




#    style = ''
#       ${builtins.readFile ./styles.css}
#
#
#      * {
#          border: none;
#          border-radius: 0px;
#          font-family: Roboto, Helvetica, Arial, sans-serif;
#          min-height: 0;
#          font-size: 24px;
#        }
#    '';
#
#    settings = [{
#      layer = "top";
#      height = 30;
#      position = "top";
#      margin-top = 2;
#      margin-bottom = 2;
#
#      modules-left = [
#        "custom/launcher"
#      ];
#
#      modules-center = [
#        "hyprland/workspaces"
#      ];
#
#      modules-right = [
#        "idle_inhibitor"
#        "pulseaudio"
#        "network"
#        "cpu"
#        "memory"
#        "temperature"
#        "battery"
#        "battery#bat2"
#        "tray"
#        "clock"
#        "custom/power"
#      ];
#
#      # Modules configuration 
#
#      "hyprland/workspaces" = {
#        disable-scrool = true;
#        all-outputs = false;
#        format = "{name}";
#      };
#
#      keyboard-state = {
#        numlock = true;
#        capslock = true;
#        format = " {name} {icon}";
#        format-icons = {
#          locked = "";
#          unlocked =  "";
#        };
#      };
#
#      "wayland/mode" = {
#        format = "<span style=\"italic\">{}</span>";
#      };
#
#      idle_inhibitor = {
#        format = "{icon}";
#        format-icons = {
#          activated =  "";
#          deactivated = "";
#        };
#      };
#
#      tray = {
#        icon-size = 20;
#        spacing = 5;
#      };
#
#      clock = {
#        format-alt = "{:%Y-%m-%d}";
#        tooltip-format = "{:%Y-%m-%d | %H:%M}";
#      };
#
#      cpu = {
#        format = "{usage}% ";
#        tooltip =  false;
#      };
#
#      memory = {
#        format = "{}% ";
#      };
#
#      temperature = {
#        format = "{temperatureC}°C {icon}";
#        format-icons = [ "" ];
#      };
#
#      battery = {
#        states = {
#          good = 95;
#          warning = 30;
#          critical = 15;
#        };
#
#        format = "{capacity}% {icon}";
#        format-charging = "{capacity}% ";
#        format-plugged = "{capacity}% ";
#        format-alt = "{time} {icon}";
#        format-icons = [ ""  "" "" "" "" ];
#      };
#
#      "battery#bat2" = {
#        bat = "BAT2";
#      };
#
#      network = {
#        #interface = "wlp2*"; #(Optional) To force the use of this interface
#        format-wifi = "";
#        format-ethernet = "";
#        tooltip-format = "{essid} ({signalStrength}%) {ifname} via {gwaddr} ";
#        format-linked = "{ifname} (No IP) ";
#        format-disconnected = "⚠";
#        format-alt = "{ifname}: {ipaddr}/{cidr}";
#      };
#
#      pulseaudio = {
#        #"scroll-step" = 1, // %, can be a float
#        format = "{icon}";
#        format-bluetooth = "{icon}";
#        format-bluetooth-muted = "{icon}";
#        format-muted = "";
#        format-source = "󰖁";
#        format-source-muted = "";
#        format-icons = {
#          headphone = "";
#          hands-free = "";
#          headset = "";
#          phone = "";
#          portable = "";
#          car = "";
#          default = [ "󰸈" "󰕾" "󰕾" ];
#        };
#        on-click = "pavucontrol";
#      };
#
#      "custom/launcher" = {
#        format = " 󱄅 ";
#        on-click = "fuzzel";
#        on-click-right = "killall fuzzel";
#      };
#        
#      "custom/power" = {
#        format = "󰐥";
#        on-click = "bash ${builtins.toString ./fuzzel-powermenu.sh}";
#        on-click-right = "killall fuzzel";
#      };
#    }];


