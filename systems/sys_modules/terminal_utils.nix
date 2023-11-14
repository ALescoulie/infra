{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    tmux
    wget
    curl
    neofetch
    sl
    htop
  ];
}

