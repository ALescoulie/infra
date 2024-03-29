{pkgs, ...}

{
  programs.tmux = {
    enable = true;
    clock14 = true;
    shortcut = "a";
    baseIndex = 1;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.tmux-powerline
      tmuxPlugins.resurrect;
    ];

    extraConfig = ''
      # Mouse works as expected
      set-option -g mouse on

      set -g @resurrect-strategy-vim 'session'
      set -g @resurrect-strategy-nvim 'session'
      set -g @resurrect-capture-pane-contents 'on'

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
    '';
  };
}

