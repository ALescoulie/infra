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
      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
      export DYLD_LIBRARY_PATH="/opt/homebrew/opt/imagemagick/lib:$DYLD_LIBRARY_PATH"
    '';

    initContent = ''
      # Powerlevel10k configuration
      source ${./p10k-config/p10k.zsh}
    '';

    shellAliases = {
      neofetch = "fastfetch";
      vi = "nvim";
      vim = "nvim";
    } // lib.optionalAttrs pkgs.stdenv.isDarwin {
      nix-darwin = "nix run nix-darwin";
      switch = "sudo nix run nix-darwin -- switch --flake ~/infra/flake.nix";
      disco = "mosh discovery -- tmux new-session -A -s dev";
    } // lib.optionalAttrs pkgs.stdenv.isLinux {
      switch = "sudo nixos-rebuild switch --flake ~/infra/flake.nix";
    };

    plugins = [{
      name = "powerlevel10k";
      file = "powerlevel10k.zsh-theme";
      src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
    }];
  };
}

