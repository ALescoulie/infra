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
      tmuxPlugins.sidebar
    ];

    extraConfig = ''
      # Mouse works as expected
      set-option -g mouse on
      set -g default-terminal screen-256color

      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-capture-pane-contents 'on'

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      set -g status-bg color141
      set -g status-fg white
    '';
  };
}

