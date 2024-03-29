{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    autocd = true;
    defaultKeymap = "emacs";

    history = {
      save = 1000000;
      size = 1000000;
      ignoreSpace = true;
      extended = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "ssh-agent" # Auto-start a SSH agent
      ];
    };

    initExtra = ''
      # Powerlevel10k configuration
      source ${./p10k-config/p10k.zsh}
    '';

    plugins = [{
      name = "powerlevel10k";
      file = "powerlevel10k.zsh-theme";
      src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
    }];
  };
}

