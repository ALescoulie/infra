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
    "AAAAC3NzaC1lZDI1NTE5AAAAIBinAdYVrOncCzb5hQsttQIDNPbBjvW1jMBicp6AK6sZ alia.lescoulie@gmail.com"
  ];
}

