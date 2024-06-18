{pkgs, ...}:

{
  fonts.fonts = with pkgs; [ 
    meslo-lgs-nf
  ];

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

