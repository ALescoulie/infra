{pkgs, ...}:

{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users."alia".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBNqvkQOVN6iCz27NLGn+LtxeJ82tMvV/Hm06QuHGiES alia@MacBook-Air.lan"
  ];

  services.tailscale = {
    enable = true;
  };

  enviornment.systemPackages = with pkgs; = [
    mosh
  ];
}

