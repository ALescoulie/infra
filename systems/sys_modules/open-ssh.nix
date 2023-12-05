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
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBinAdYVrOncCzb5hQsttQIDNPbBjvW1jMBicp6AK6sZ alia.lescoulie@gmail.com"

    ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzOldznsa4smeKJu5zRoPpxYH9S/15Pjzl2hxCHZ1cpcLeJaRYXV5XqWnhIZ1ieAa2h7ljJzh+oIvFgU4t8Pi8BqIz2LRg2uYMBS9O8rWQLChZ
++FaUQOE9wcw1fX0QVCkA3uQj70MLd9YbxJyWPtsZC0oUzPROKt46o1DT5t//LYBv2tlviTrxMGzKOGAQygJxBAAp7XefB4PjMQuYZWnrpUln7FDsgTOHosgBRIc63/MCatCQQPAnTY1nLf08ERm
8C0e/RDVxcdqz+cshQVgAI8BGqe0FFMsz75uwC4qRkbfKKAVWua6FGfXFeIJ2cNlozw4wRd29tr3j3HSfG/XjCpyBOmOm6/lmk+sV3OxhrqQq4A9QEw55BWlAtZ0IXEuMLGLiX+0OITo/RvfI/eS''
  ];
}

