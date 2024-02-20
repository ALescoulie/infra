{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    tmux
    tree
    wget
    curl
    neofetch
    sl
    htop
  ];
}

