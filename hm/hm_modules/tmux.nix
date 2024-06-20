{pkgs, ...}:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "a";
    baseIndex = 1;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.resurrect
    ];

    extraConfig = ''
      # Mouse works as expected
      set-option -g mouse on
      set -g default-terminal screen-256color
      set -g HYPRLAND_INSTANCE_SIGNATURE = "$HYPRLAND_INSTANCE_SIGNATURE"

      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-capture-pane-contents 'on'

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
    '';
  };
}

