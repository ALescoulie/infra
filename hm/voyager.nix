{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.username = "alia";
  home.homeDirectory = /Users/alia;
  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);


  imports = [
    ./hm_modules/direnv.nix
    ./hm_modules/zsh/zsh.nix
    ./hm_modules/tmux.nix
    ./hm_modules/kitty.nix
  ];

  home.packages = with pkgs; [
    poetry
    cargo
    neofetch
    tmux
    iterm2
    ripgrep
  ];

  programs.zsh.enable = true;
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };
}
