{pkgs, ...}:

{
  fonts.packages = with pkgs; [
    meslo-lgs-nf
  ];

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    tmux
    tree
    wget
    curl
    fastfetch
    sl
    htop
  ];
}

