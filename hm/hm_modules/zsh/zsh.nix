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

    initContent = ''
      # Powerlevel10k configuration
      source ${./p10k-config/p10k.zsh}
    '';

    shellAliases = {
      neofetch = "fastfetch";
      vi = "nvim";
      vim = "nvim";
      nix-darwin = "nix run nix-darwin";
    };

    plugins = [{
      name = "powerlevel10k";
      file = "powerlevel10k.zsh-theme";
      src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
    }];
  };
}

