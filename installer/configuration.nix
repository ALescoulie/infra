{pkgs, modulesPath, ...}:
{

  imports = [
    # https://nixos.wiki/wiki/Creating_a_NixOS_live_CD
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    "${modulesPath}/installer/cd-dvd/channel.nix"

    ../systems/sys_modules/open-ssh.nix
    ../systems/sys_modules/terminal-utils.nix
  ];
  users.users.alia = {
    isNormalUser = true;
    description = "Alia Lescoulie";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
