{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    swappy
    wl-clipboard
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = null;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      menu = "${pkgs.fuzzel}/bin/fuzzel";
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
        {command = "waybar";}
        {command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";}
        {command = "wl-paste --type text --watch cliphist store";}
        {command = "wl-paste --type image --watch cliphist store";}
      ];
      
      window = {
        titlebar = false;
        commands = [
          {
            criteria = {
              app_id = "scratchpad";
            };
            command = "floating enable";
          }

#          {
#            criteria = {
#              app_id = "scratchpad";
#            };
#            command = "resize set width 1920 px height 1080 px";
#          }
#
#          {
#            criteria = {
#              app_id = "scratchpad";
#            };
#            command = "move position center";
#          }
#
          {
            criteria = {
              app_id = "scratchpad";
            };
            command = "move scratchpad";
          }
        ];
      };

      output = {
        "DP-1" = {
          pos = "3840 0";
          bg = (builtins.toString ./wallpapers/juno-orange.jpg) + " fill";
        };
        "HDMI-A-1" = {
          pos = "0 0";
          bg = (builtins.toString ./wallpapers/juno-blue.jpg) + " fill";
        };
      };
      bars = [ ];
      keybindings = lib.mkOptionDefault {
        # Full-screen screenshot, saved and copied to clipboard
        "${modifier}+Shift+f" = ''exec mkdir -p ~/Pictures/Screenshots && grim - | tee ~/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S').png | wl-copy'';
        "${modifier}+l" = "exec swaylock";
        # Region-select screenshot, saved and copied to clipboard
        "${modifier}+Shift+s" = ''exec sh -c 'mkdir -p ~/Pictures/Screenshots && geom="$(slurp)" && grim -g "$geom" - | tee ~/Pictures/Screenshots/$(date +"%Y-%m-%d-%H%M%S").png | wl-copy' '';
        # Region-select, straight into swappy for annotation before saving
        "${modifier}+Shift+a" = ''exec grim -g "$(slurp)" - | swappy -f -'';
        "${modifier}+v" = ''exec sh -c 'cliphist list | fuzzel --dmenu | cliphist decode | wl-copy' '';
        "${modifier}+e" = "exec kitty -e yazi";
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        "${modifier}+Shift+grave" = "exec ${builtins.toString ./scratchpad-toggle.sh}";
      };
      floating.modifier = "Mod4";
      focus.followMouse = false;
    };

  };

  programs.swaylock = {
    enable = true;
    settings = { };
  };

  xdg.configFile."swaylock/config".text = ''
    image=DP-1:${builtins.toString ./wallpapers/juno-orange.jpg}
    image=HDMI-A-1:${builtins.toString ./wallpapers/juno-blue.jpg}
    ignore-empty-password
    show-failed-attempts
  '';

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300; # 5 minutes
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        timeout = 600; # 10 minutes
        command = "swaymsg 'output * dpms off'";
        resumeCommand = "swaymsg 'output * dpms on'";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
  };
}

