{pkgs, ...}:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "Space";
    baseIndex = 1;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.resurrect
      tmuxPlugins.sidebar
      tmuxPlugins.continuum
    ];

    extraConfig = ''
      # Mouse works as expected
      set-option -g mouse on
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",*256col*:Tc"

      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-capture-pane-contents 'on'

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      set -sg escape-time 10

      set -g history-limit 50000

      set -g focus-events on

      setw -g mode-keys vi

      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '15'

      set -g status-bg color141
      set -g status-fg white
      set -gq allow-passthrough on
    '';
  };
}

