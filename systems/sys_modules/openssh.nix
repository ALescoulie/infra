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
    ""
  ];
}

