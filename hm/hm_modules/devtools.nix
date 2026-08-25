{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    lldb
    python3Packages.debugpy
    vscode-js-debug
    ocamlPackages.earlybird
    lazygit
  ];
}

